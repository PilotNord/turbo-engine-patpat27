# LINUX General Checklist

Simply treat this like a general reminder, I guess, since you can use Google responsibly anyway.

This checklist is sectioned off pretty well, but remember to look up things when necessary.

Tick stuff off mentally since Github is not good for that :p

*Skip to the TL;DR down there if you would like~*

## Useful List of Commands(courtesy of sinclair)

### Service Management
* `systemctl status service`
  * Check the status of a service.
* `systemctl start service`
  * Start a service.
* `systemctl stop service`
  * Stop a service.
* `systemctl restart service`
  * Restart a service.
* `systemctl enable service`
  * Enable a service to start on
boot.
* `systemctl disable service`
  * Disable a service from
starting on boot.
* `sudo apt install BUM`
  * On Boot Service Manager GUI
* `systemctl list-units --type=service --state=running`
  * List all running services
* `systemctl list-units --type=service --state=active`

### Packages(so updates and such)

* `sudo apt-get update` to update current package list and prepare for download.
* `sudo apt-get upgrade` to upgrade(download and install) current installed packages.
* `sudo apt-get install package` to install a specific new package
* `sudo apt-get remove package` to remove a package.

### User Management

* `adduser username`
* `deluser username`
* `passwd username`
* `usermod -a -G group username` for group change
* `sudo gpasswd -d username groupname` to remove users from group

Other common commands can be discovered online, Linux's open-source nature means you are bound to find some good documentation.
  
## Initial Start

- [ ] Be prepared remember you can use the Internet.
- [ ] Confirm the correct team ID (this should already be known).
- [ ] Read the VM README first.
  - Important!!!!!
- [ ] Start with forensics first to avoid issues later.
  - You can use Google and AI carefully, but be careful
- [ ] Take notes throughout the process.
  - Record commands used, created/disabled users, and important changes.
  - Use a virtual notepad, spreadsheet, or similar
  - Not completely necessary but useful for keeping track

## Linux Time, HAIL TUX

### TL;DR?
- [ ] *All right, you're lazy.*
- [ ] README first.
- [ ] Change users and groups, disable, add, edit.
- [ ] Add or change passes
- [ ] Password policies should be fixed
- [ ] Change system, security policies
- [ ] Enable/disable necessary services
- [ ] Secure software by updating/removing/setting them
- [ ] Remove bad programs and media.
- [ ] Run updates during lunch.
- [ ] ***IMPORTANT FOR LINUX*** 
Please do not update packages during your work, or you may cause issues!

### Forensics

- [ ] Use `ls -la` 
- [ ] Check logs at `/var/log/`
You can use `cat` or a text editor like `vim`
- [ ] Yes, you will have to look at system processes and network activity.

### User Management
- [ ] Check user list on README
- [ ] `sudo deluser` or `sudo adduser` to add or remove users.
- [ ] `sudo cat /etc/passwd for seeing all users.`
- [ ] `sudo getent group sudo` for users in "sudo," or admin group.
- [ ] Remove or add admin perms as necessary.
- [ ] All users need to have a secure password:
      * Uppercase letter
      * Lowercase letter
      * Number
      * Special character
      * README has admin passwords.
      * Use `sudo passwd (username)` to change

### Password Configuration

- [ ] Check the README for actual requirements!!!
- [ ] Follow pass reqs as stated above.
- [ ] Config file is `/etc/pam.d/common-password`
- [ ] Add `minlen=12 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1` to end of `pam_pwquality.so` or `pam_unix.so` line.
- [ ] `sudo nano /etc/login.defs` to edit more configs
      * PASS_MAX_DAYS 90
      * PASS_MIN_DAYS 7
      * PASS_WARN_AGE 7

- [ ] Disable Guest Account, depending on display manager.
- [ ] Generally use  `cat /etc/X11/default-display-manager` to check display manager. Usually LightDM. Search if not.
- [ ] If LightDM, create LightDM cconfig file using `sudo nano /etc/lightdm/lightdm.conf`
- [ ] `allow-guest=false` and then `sudo systemctl restart lightdm`
- [ ] Enable IPv4 TCP SYN cookies
      * `sudo nano /etc/sysctl.conf`
      * `net.ipv4.tcp_syncookies=1` must be set or added
- [ ] Find a base version of sysctl.conf, before editing it to make it more secure!
- [ ] Check file permissions with `ls - l`, it should be `-rw-r-----`
- [ ] If not, use `sudo chmod 640 (filepath)` to do that.

- [ ] Secure browser by turning on settings that block dangerous content.


### Services and Such
- [ ] Remove malware like the rootkits, ransomware, viruses, etc
  * Use stuff like ClamAV, chkrootkit, rkhunter, update, restore from backups.
- [ ] Check that the firewalls are running well.
    * `iptables` or `firewalld`
    * Secure SSH through `/etc/ssh/sshd_config`
    * Disable unused services
    * Regularly update and patch system
      * Like, regularly run `sudo apt update` and then `sudo apt upgrade`
    * Backup often.
    
- [ ] README has critical services.
- [ ] Install UFW for firewall if needed! Start it.


### Software and Media
- [ ] Use `sudo apt list --installed` for installed packages.
- [ ] Delete packages with `sudo apt purge`
- [ ] Hacking tools like:
      * Hydra
      * Deluge
      * Wireshark
      * Ophcrack
      * Johntheripper
      * nmap
      * etc
      Should be deleted.
- [ ] Make sure to update and THEN upgrade package lists, auto remove unused packages, reboot after.

- [ ] Turn on automatic update checks in *update app.*

- [ ] Delete media files, ZIP files, use `sudo rm` if needed.



