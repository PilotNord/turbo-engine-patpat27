# Scripting

## Bash

### Why
- Interact directly with the OS using commands
- Automate repeptitive tasks effeciently
- Uses fewer system resources

### ex
- `ls`: Lists files in dir
- `cd`: Change Directory
- `sudo`: super user
- `echo`: say something

### Storage
- github

### .sh
- scripting files for linux
- edited in nano, vim, gedit, etc

- ***EVERY SCRIPT SHOULD START WITH #! /bin/bash***

### To execute
- Locate it
- Run it with `bash <script>`

### Syntax
- Access variable with $ sign `$bp`
- Create arrays with `(a, b, c)`
- To access `${array[i]}`
- Set `i` to `@` to refer to the whole array
- Adding -a will allow inputting an array

#### if statements
- `if [ condition ]; then <slop> else <slop> fi`

#### for loops
- `for varName in ${arrName[@]} do <slop> done`

### Use it for...
- Update/upgrade
- Edit lightdm
- Enable UFW Firewall
- Search for probhibited Files
- Install Dependencies
- Install and configure applications
- Set security policies
- Change passwords
- Adding users
- Verifying admins

### Team Roles
- ~2 windows
- ~2 linux
- 1 cisco

## Batch
- Bash for winows

### Commands
- REM - Comment
- set /p - creates a variable
- Cls - clear
- For loops: `FOR %%F IN (*.txt) DO echo %%F`
- `net user` - the command for managing local user accounts
- `/active:yes/no` - sets the accounts to active/inactive

#### passwords
- `/uniquepw` Enforce password history
- `/maxpwage` Max password age
- `/minpwage` Minimum password age
- `minpwlen`f Minimum password length

#### audit policy
- `Auditpol` - access audit policy
- `/set/category:*` - selects all options within audit poli
- `success:enable` - sets all to success
- `/failure:enable` - set all to failure

#### Local Security Policy
- `reg add` - add or modify register value
- `_____` - path
- `/v ____` - speciic setting
- `/t reg_dword` - the data type
- `/d 1` - sets to enabled or on
- `f` - overwrites the existing value
##### ex
- `reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DsiableCAD" /t REG_DWORD /d 0 /f`

#### Services
- `sc stop ---` access services and stops
- `sc config ---` config

### Running it
- right click run as adminstrator

## LGPO
- windows hardening tool
- premade policies that help you harden before your script is fully created
- used in tandem with your script
### installing it
- look up "Microsoft Security Compliance Toolkit 1.0"
- click download and select lpgo.zip

### setup
- extract, copy the program into the security baseline -> scripts -> tools
- open powershell and run the command `Get-ExecutionPolicy`
- if it says remotesigned than ur ok, if it says restricfted run `set-executionploicy remotesigned`
