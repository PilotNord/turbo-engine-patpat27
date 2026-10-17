# General Checklist
## Typical--

- [ ] Be prepared, remember you can use the Internet.
- [ ] Input the correct team ID(probably should have already had it)
- [ ] First thing is to **read the README(of the VM)**
* Has most issues, but you also have to know some things.
- [ ] Probably begin on the forensics *first,* to prevent issues later.
* Can use Google and AI, *carefully*
- [ ] Maybe *take notes.* Commands done, users, etc etc
* Do this on a virtual notepad or spreadsheet.

## Windows
### User Management

- [ ] Open Admin Tools and then Computer Management
- [ ] **Disable** users through Local Users and Groups(Users folder)
- [ ] Add/remove users from Admin group through Groups folder(admin privileges)
- [ ] Create new groups if asked to.
- [ ] PASSWORDS for ALL users through Control Panel, "manage other accounts"
- [ ] "Must change password on next logon" checked.


### Password Configs

- [ ] Follow password policy as outlined in README(again, the VM one)
* Generally(but not always, read the README!!!):
  * Enforce pass history (5 pass)
  * Max pass age(90 days)
  * Min pass age(30 days)
  * Min length(12 chars)
  * Complexity requirements(enabled)
  * Store pass encryption(all users disabled)
  * **Change all this through Password Policy in Local Security Policy GUI**

 - [ ] Account policies as well(according to README)
* Generally,
  * Account lockout duration (30 minutes)
  * Account lockout threshold (5 invalid)
  * Reset account lockout counter after (30 minutes)
  * **Change through account lockout policy, Local Security Policy**

- [ ] Audit Policy through audit policy in Local Security Policy, all set to **(Success/Failure)**
- [ ] Most changes can be found in README.

- [ ] In Security Options of Local Security Policy...
- [ ] Do not require CTRL ALT DEL *disabled*
- [ ] *Enable* Do Not Display Last Username At Sign In
- [ ] Disable and rename Guest and Administrator accounts (literal names)
  - [ ] Just like any other user.

- [ ] "Do not allow remote connections to this computer," uncheck Remote Assistance.
- [ ] Turn file and printer sharing OFF in Advanced Sharing Settings.
- [ ] Check whether Network Discovery should be disabled or not.

Unless README otherwise states...
- [ ] Disable Telnet Server
- [ ] Disable Remote Registry
- [ ] Disable Internet Connection Sharing
- [ ] Disable FTP Server
- [ ] Disable SNMP/SNMPTrap Network Monitoring
- [ ] Disable Print Spoolers
- [ ] Disable TapiSrv

- [ ] services.msc for disabling unnecessary services.


### Software and Stuff (Installed Apps)
- [ ] Check which packages need to be deleted or not. README
- [ ] Hacking tools, purge 'em!
- [ ] Update necessary apps as stated in README
- [ ] Update Windows
- [ ] ***DOWNLOAD UPDATES,*** do **NOT** install them yet.
* It'll take too, too long! Do that during *lunch!*

- [ ] Delete prohibited media files stated in README.
* Use search, Get-ChildItem, void tools everything, WizTree, even File Explorer

- [ ] Check for any unnecessary shared folders, unless README wants them.
- [ ] Edit them through Computer Management.
* Default shares have a $
 

