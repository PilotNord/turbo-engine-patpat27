# Windows Server time!!!
# 11/9: Week 9
# Reminder
## More Forensics Examples
- Most Forensics are low-key easy IF you search w/google correctly
- DELETE ANYTHING MALICIOUS AFTER FORENSICS IS COMPLETE
### Windows Forensic 1
a backdoor running on this machine under "bd". What port is this backdoor configured to listen on?
### 2
A .exe file makes a goose run around. What is the absolute path to it?

## Helpful Apps
- Voidtools Everything: finds things much faster than goober ahh file explorer
- Malwarebytes: can help identify bad things: niche and will flag scoring system, DO NOT DELETE
- TCPView: allows users to close connections manually and is useful for identifying remote access points on a VM
- Sigcheck: checks if files have a valid digital signature
Commands:
1. Sigcheck.exe C:\path\file.exe - check
2. Sigcheck -u -e C:\Users - lists .exe
3. sigcheck -h file.exe - shows hashes

Note that these are niche; only use if in a pinch
voidtools are godly tho get that

## Local Security Policies
copy/paste this later from GC - too many to type

## Windows Event Viewer
How to Open Event Viewer

• Start Menu: Click the Start button, type Event Viewer, and press Enter.
• Run Dialog: Press Windows Key + R, type eventvwr (or eventvwr.msc), and press Enter.

- 5 Types of events: Application, Security, Setup, System, Forwarded Events
- All are useful, but most are application and security logs
- 4 levels of severity, in increasing order: Information, Warning, Error, Critical
- You can filter logs by logged time period, event level, task category, and keywords
- Repeating errors are possible. This means there is a recurring issue, and the simple solution is to disable it.

1. There are many different errors and warnings, but not all mean the computer is broken
2. Don't waste a bunch of time sifting through it
3. Event Viewer can be tricky; low priority
4. Use in cases: to quickly scan for big/reoccuring issues and when you have some time
5. ## Programs and Features
Used to uninstall or change programs
Windows + R, then appwiz.cpl
This shows a bunch of folders; consult README
box w/nothing in it = disabled, vice versa
## Windows browser settings
Browser in README should be set to default
settings > apps > default apps > [browser] > set as default

## Persistence/Startup apps
Most applications shouldn't be on startup apps; only things like Windows Defender and Windows default stuff on
Task Manager> Startup apps

## Windows Defender Firewall
Windows search or open Control Panel to access
By default, allows all out; blocks all in unless communicating
If the firewall is off, it shows up red
To turn it on, use recommended settings
To access the rules section, open Advanced Settings in WDF
## Blocking a program
New rule > select [program] > Block/allow connection > skip profiles > give name
## Blocking a port
Outbound rules > new rule > port and next > enter port # > block/allow communication > all profiiles > give name > finish
