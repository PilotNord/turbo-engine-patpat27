# General Checklist

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

## Windows

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

### User Management

- [ ] Open Administrative Tools, then Computer Management
- [ ] Disable users through Local Users and Groups -> Users
- [ ] Add or remove users from the Admin group through Groups -> Administrators.
- [ ] Create new groups if README wants it
- [ ] Set passwords for all users through Control Panel -> Manage Accounts.
- [ ] Ensure "User must change password at next logon" is enabled.

### Password Configuration

- [ ] Follow the password policy outlined in the README for the VM.
  - Check the README carefully--requirements may vary
  - General requirements:
    - Enforce password history: 5 passwords
    - Maximum password age: 90 days
    - Minimum password age: 30 days
    - Minimum password length: 12 characters
    - Password complexity requirements: enabled
    - Store password encryption: all users disabled
  - Configure these through Local Security Policy -> Password Policy.

- [ ] Review account policies in README.
  - Generally:
    - Account lockout duration: 30 minutes
    - Account lockout threshold: 5 invalid attempts
    - Reset account lockout counter after: 30 minutes
  - Configure thru Local Security Policy -> Account Lockout Policy.

- [ ] Set the audit policy through Local Security Policy.
  - Configure ALL policies to Success and Failure.
- [ ] Check the README for actual requirements

### Security Options

- [ ] Review settings in Local Security Policy -> Security Options.
IMPORTANT
- [ ] Disable "Do not require CTRL+ALT+DEL".
- [ ] Enable "Do not display last username at sign in".
- [ ] Disable and rename the Guest and Administrator accounts.
  - Edit them like any other user account.
- [ ] Disable Remote Assistance by unchecking "Do not allow remote connections to this computer."
- [ ] Turn off file and printer sharing in Advanced Sharing Settings.
- [ ] Check whether Network Discovery should be disabled.

### Services and Security Hardening

Unless the README says otherwise:
- [ ] Disable Telnet Server
- [ ] Disable Remote Registry
- [ ] Disable Internet Connection Sharing
- [ ] Disable FTP Server
- [ ] Disable SNMP/SNMP Trap Network Monitoring
- [ ] Disable Print Spooler
- [ ] Disable TapiSrv
- [ ] Use services.msc to disable unnecessary services.

### Software and Installed Applications

- [ ] Check which packages should be removed or not according to the README.
- [ ] Remove hacking tools and unwanted software
- [ ] Update required applications as specified in README
- [ ] Update Windows--BUT!
- [ ] Download updates, but do not install them yet.
  - This can(will) take too long, so do it during lunch if needed.
- [ ] Delete prohibited media files as specified in the README.
  - Use search tools, Get-ChildItem, void tools, (maybe) WizTree, or even File Explorer.
- [ ] Check for any unnecessary shared folders unless README requires them.
- [ ] Edit shared folders through Computer Management.
  - Default shares may include a `$` suffix at the end.
