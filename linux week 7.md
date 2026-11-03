# Sysctl.conf

## Sources List
- there is a file located at `/etc/apt/sources.list`
- there is a dir at `/etc/apt/sources.listd`

- a sign that the sources list has been affected is that updates are not running correctly

## Sysctl Advanced
- sysctl.conf has a LOT of configs (even too many to talk about them)
- some more important configs are:
  - `kernel.randomize_va_space = 2`
  - `net.ipv4.icmp_echo_ignore_broadcasts = 1`
  - `net.ipv4.tcp_max_syn_backlog = 20480`
  - `net.ipv4.ip_forward = 0`
  - (dont forget about syncookies)
- use `sysctl -p` to apply configs

## Crontab
- crontab manages scheduled tasks in Linux
- located at `/etc/crontab`
- entries typically appear at the bottom with a time configuration, user, shell configuration, etc
- heres an example
<img src="https://linuxhandbook.com/content/images/2020/06/crontab-explanation.png" width="500px">

### time def
- `*` indicates "every"
- `/#` indicates "every # of time"
- `*` under minute means every minute

### crontab files
- there are directories named `cron.hourly`, `cron.daily`, `cron.weekly`, and `cron.monthly` in the `/etc` directory

### malicious cron entries😈
- they are typically python files 
- backdoor for attackers
- all cron things should be verified

## Securing servers
- in cyberpatriot, common server types are FTP (vsftpd), SSH, and Apache2
- edit config files!
- SSH - `/etc/sshd/ssh_config`
- ftp - `/etc/vsftpd.conf`
- Apache2 - `/etc/apache2/apache2.conf`
- only secure critical services, otherwise delete that shi
### look for 
- `LoginGraceTime 60`
- `PermitRootLogin=no`
- `Protocol 2`
- `PermitEmptyPasswords no`
- `PasswordAuthentication yes`
- `X11Forwarding no`
- `UsePAM yes`
- `UsePrivilegeSeparation yes`
#### FTP
- `anonymous_enable=NO`
- `anon_upload_enable=NO`
- `anon_mkdir_write_enable=NO`
- `anon_other_write_enable=NO`
- `local_enable=YES`
- `write_enable=YES`
- `chroot_local_user=YES`

## Lightdm
-   `sudo nano /etc/lightdm/lightdm.conf`
-   ALWAYS HAVE `[Seat: *]` AT THE START or it will brick your computer
-   configs to set
    - `allow-guest=false`
    - `greeter0hide-users=true`
    - `greeter-show-manual-login=true`
    - `autologin-user=none`
## Sudoers
- whole lotta fluff
- few lines set privileges for the root user, admin group, and sudo group
- they are default and normal to have
### what to look out for!
- the `root`, `%admin`, and `%sudo` should look like the default (`ALL` is good to have while `NOPASSWD` values are insecure)
