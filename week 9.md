# nyaaahhhh~~~~~ week 9!

## GDM3 Configs
- first edit greeter configs: `sudo nano /etc/gdm3/daemon.conf`
- in the `[daemon]` block, set: `AutomaticLoginEnable=false`
- apply changes with `sudo dpkg-reconfigure gdm3` and `sudo reboot`!
- if you get into a login loop, hit restart guest in vmware
- if you accidently break configs and get stuck on login, `ctrl+alt+f3`

## Init.d
- /etc/init.d stores shell scripts used to manage system services
- check dir for sus scripts (and delete them dont do the chase method)
- can help you find services to DELETE

## More Crontab
- `sudo ls /var/spool/cron/crontabs`
- `sudo crontab -u <username> -l`
  - lowk script this with for loop and var
- `sudo crontab -e` check root crontab

## lockout policy
- `/etc/security/faillock.conf`
- set: `deny=3`, `fail_interval=900`, `Unlock_time=600`
- `sudo nano /etc/pam.d/common-account` (edit common acc)
- find line with account required and change `pam_permit.so` to `pam_faillock.so`
- `sudo nano /etc/pam.d/common-auth`
- find line with auth required and change `pam_permit.so` to `pam_faillock.so`

## Port stuff
- cyberpatriot has been known to ask forensics about ports, backdoors, etc
- `sudo ss -ln`
- `sudo ss -tulnp`
- `sudo lsof -i -n -P`
- you can use these to inspect ports, the network, what processes are listening, etc

