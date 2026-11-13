#!/usr/bin/env bash
# Go through every normal user one by one: set preset password, delete, or skip.
# Run with: sudo bash user_audit.sh

if [[ $EUID -ne 0 ]]; then
    echo "Run this as root (sudo bash $0)"
    exit 1
fi

# Safeguard: back up account files and log every action
BACKUP_DIR="/root/user_audit_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR" && chmod 700 "$BACKUP_DIR"
cp -p /etc/passwd /etc/shadow /etc/group /etc/gshadow "$BACKUP_DIR"/ || { echo "Backup failed, exiting."; exit 1; }
LOG="$BACKUP_DIR/actions.log"
echo "Backup of account files saved in $BACKUP_DIR (restore by copying them back to /etc)."

# Ask for the preset password once (hidden input, not stored in the script)
read -rsp "Preset password to assign: " PRESET_PW; echo
read -rsp "Confirm preset password:   " PRESET_PW2; echo
if [[ "$PRESET_PW" != "$PRESET_PW2" || -z "$PRESET_PW" ]]; then
    echo "Passwords empty or don't match. Exiting."
    exit 1
fi

# Normal users: UID 1000-59999, excluding 'nobody'
mapfile -t USERS < <(awk -F: '$3>=1000 && $3<60000 && $1!="nobody" {print $1}' /etc/passwd)

echo "Found ${#USERS[@]} user(s)."

for u in "${USERS[@]}"; do
    echo
    echo "=============================="
    echo "User: $u"
    echo "  UID/info: $(getent passwd "$u" | cut -d: -f3,5)"
    echo "  Groups:   $(id -nG "$u" | tr ' ' ',')"
    if id -nG "$u" | tr ' ' '\n' | grep -qxE 'sudo|admin'; then
        echo "  ** This user is an ADMINISTRATOR (sudo group) **"
    fi
    if [[ "$u" == "${SUDO_USER:-}" ]]; then
        echo "  ** This is the account you are running this script from **"
    fi

    read -rp "[p]assword reset / [d]elete / [s]kip / [q]uit ? " choice
    case "${choice,,}" in
        p)
            if echo "$u:$PRESET_PW" | chpasswd; then
                echo "Password set for $u."; echo "$(date +%T) password reset: $u" >> "$LOG"
            else
                echo "Failed to set password for $u (check password policy)."
            fi
            ;;
        d)
            if [[ "$u" == "${SUDO_USER:-}" ]]; then
                echo "Refusing to delete the account you ran this script from."
                continue
            fi
            read -rp "Are you sure you want to DELETE '$u' and their home directory? (yes/no) " confirm
            if [[ "${confirm,,}" == "yes" ]]; then
                pkill -u "$u" 2>/dev/null
                if userdel -r "$u"; then
                    echo "Deleted $u."; echo "$(date +%T) deleted: $u" >> "$LOG"
                else
                    echo "Failed to delete $u."
                fi
            else
                echo "Cancelled, $u kept."
            fi
            ;;
        q)
            echo "Quitting."
            break
            ;;
        *)
            echo "Skipped $u."
            ;;
    esac
done

echo
echo "Done."
