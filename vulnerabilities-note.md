# Basic vulnerabilities [Week 03]

 - General
   - Work through every flaw just in case. Not all will give you points.

     
  ## README
- Look through README every time.
 - Solve things in them for points, some things you just have to know.

- *Scenario is important to read!* Purpose, context.
  - Authorized users, passwords, and other is found here.
  - Critical services must be **kept.**
  - A note at the bottom is just a reminder.



## User Management,
--------
### Linux User Management

- Get list of users from README
  
- `sudo getent password {1000..6000}` lists existing users
  - `sudo cat /etc/passwd` sees all users.
    
- `sudo deluser <user>` and `sudo adduser <user>` to delete and add users, respectively.

#### Admin Management
- `sudo getent group sudo` lists admins
- `sudo deluser <user> sudo` removes admin status
- `sudo usermod -aG sudo <user>` adds admin status.

#### Passwords
- Secure passwords have: an uppercase letter, lowercase letter, a number, a special character, 12+ characters
  
- `sudo passwd <user>`
  - Enter password twice.
  - You will type blindly.

### Windows User Management

- Thru Computer Management
  - `Admin Tools -> Computer Management Application`
   
  - `Local Users -> Account Is Disabled` to disable.
   
 - ***Try not to delete users!!!***
   - You may need their files, re-enable, etc

 - To add user, right-click -> Add User

#### Admin Management

- Select the Groups folder in the same GUI to add or remove users as necessary.
  
- README may ask you to create mew group, has everything you need.
  
- Administrators group is to be edited.

#### Passwords
- Every user MUST have passwords.
- `Control Panel -> User Accounts -> Manage Other Accounts`
  - No password? Computer Management.
    
- `User must change password at next logon` must be checked.

- Remember passwords.


  
-------

## Configs, 
-------
*Not all VMs follow exact settings...*

### Linux Configurations

- `sudo nano /etc/pam.d/common-password`
  - Opens password config, you can replace `nano` with whatever text editor you have/want.
    - `vim`, `mousepad`, anything works.
    
  - Find line with *pam_pwquality.so` or `pam_unix.so`
    
   - Add at the end: `minlen=12 ucredit =-1 lcredit=-1 dcredit=-1 ocredit=-1`

 - `sudo nano /etc/login.defs`
   - Find `PASS_MAX_DAYS #, PASS_MIN_DAYS #, and PASS_WARN_AGE #`
   - Change to:
     - 90
     - 7



 - Guest account should be disabled.
 - DEPENDS ON DISPLAY MANAGER!!!
 - 
 - `cat /etc/X11/default-display-manager`
   
 - LightDM
   - sudo nano /etc/lightdm/lightdm.conf
      - Edit this conf specifically for LightDM
      - Remember `sudo systemctl restart lightdm` to check.
 

### Windows Configurations

#### Password Policies

- `windows -> search -> admin tools -> local security policy -> local accounts policy` for adjusting policies.
- `windows -> search -> admin tools -> local security policy -> local policy -> audit policy` for adjusting policies.
  - Set All (Success/Failure)
 
#### User Rights assignments
- `Windows -> Search -> Windows Tools -> Local Security Policy -> Local Policy -> User Rights Assignment`


#### Security Options
- `Windows -> Search -> Windows Tools -> Local Security Policy -> Local Policy -> Security Options`
- Do not require ctrl + alt + del **disable**
- Do not require display last username at sign in **enable.**

Do your own research~!!!



## Software, Services, and Files.
