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
