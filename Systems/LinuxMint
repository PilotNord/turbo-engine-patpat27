## Forensics

`getent paswd | cut -d: -f1` 
- This check user command is for the sake of not missing users, like that "felix." Hidden users will be shown.
  - Don't forget some users are not actual users; root, ftp
  - Zero users to remove? Suspicious, keep looking.

- Remove unauthorized admins.
  - `sudo groupadd`
  - `sudo gpasswd`


## Login Configs
- `sudo getent shadow {username}`
  - Checks root line in shadow file for password/account details.
  - For all those fake accounts.
  - First blank section is blank password.
- `sudo passwd -l root`

### Password Age
- login.defs only affects new accounts!
- `sudo cat /etc/shadow` for checking min/max password age of each account. 7/90 is safe.
- `sudo change -m 7 -M 90 {user}` is how you fix any accounts without it.

- `sudo apt install libpam-cracklib` for the sake of installing libpam-cracklib
- Edit common password config with `sudo nano /etc/pam.d/common-password`
- Create password requirements by adding `minlen=12 ucredit=1 lcredit=-1 dcredit=-1 etcetcetc`

- No null paswords!
  - Edit with `sudo nano /etc/pam.d/common-auth`
  - Delete `nullok`
  - Check this everytime!

### Account Lockout Policy
- Create new files for this:
  - Create them in /usr/shar/pam-configs
      - faillock
      - faillock_reset
      - faillock-notify
      - Create them using `nano`
- Use `sudo-pam-auth-update` to access PAM config.
- Arrows, spacebar, and enter to activate account lockout policy.

## Network
- Install and enable ufw
  
### SYN Cookies
- `sudo nano /etc/sysctl.fong`
- net.ipv4.tcp_syncookies=1
- `sudo sysctl -p`

### Prohibited Files
- `sudo find /home -name *.ogg`, used to find unrelated media files. Replace `ogg` with other file extensions.
- `sudo rm -r /path/to/directory`
- Hacking tools are bad as well--`locate *.zip`
- Delete python tool files: `sudo rm /usr/games/pyrdp-master.zip`

- Oh crap!!! A backdoor from the forensic questions?
- Delete the python script `sudo rm /usr/share/zod/kneelB4zod.py`
- Use pkill to stop the process.

## Updates
- Updates doing nothing? Suspicious.
- Use Software Sources app to restore default settings for Official Repositories.
- Update package lists: `sudo apt update -y`
- Update packages: `sudo apt upgrade -y`

## Managing Services
- List out services: `sudo service --status-all`
- Determine the wrong ones.
- Remove the prohibited ones: `sudo apt purge {name} -y`
- nginx always deleted(unless otherwise stated), squid

## Prohibited Applications
- Check installed applications in the software manager rather than package lists.
- Use `sudo apt purge {name} -y`

