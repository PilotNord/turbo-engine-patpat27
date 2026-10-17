# LINUX General Checklist

Simply treat this like a general reminder, I guess, since you can use Google responsibly anyway.

This checklist is sectioned off pretty well, but remember to look up things when necessary.

Tick stuff off mentally since Github is not good for that :p



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


### Password Configuration

- [ ] Check the README for actual requirements

### Security Options

### Services and Security Hardening
- [ ] Remove malware like the rootkits, ransomware, viruses, etc
  * Use stuff like ClamAV, chkrootkit, rkhunter, update, restore from backups.
- [ ] Check that the firewalls are running well.
    * `iptables` or `firewalld`
    * Secure SSH through `/etc/ssh/sshd_config`
    * Disable unused services
    * Regularly update and patch system
    * Backup often.


### Software and Installed Applications


