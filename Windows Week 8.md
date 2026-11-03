# It's Windows time!!!
R-C stands for Right-Click; I was lazy

Week 8 - 11/2
## 1: Server Usage
-Manage Users, networks, etc
Differences
sevrer os
made for networks and organizations
runs network/server services
designed to serve many people
  Vocab
Server = computer
Role = what to do
Service = program to do [role]
General guide
check users, accounts, review security settings/polices
Forensics generally the same
main difference is that for points you config it correctly
## Server Managers
### Internet Protocols
IP address: unique address
Subnet Mask: size of network
Default gateway: router to reach the internet
DNS server: translates domain names (google.com) into IP addresses
### Server Manager Home
Main hub for configs and navigating Windows Server
deactivated = red
To activate, start a specific service
to turn on service = right-click > turn on
Also can use PowerShell
### Local Server
where you rename the computer, join it to domain, enable remote desktop
### All servers
lists servers that have been added
Some include: DNS, DHCP, File Server, Domain Controller, NTP, IIS
To manage, click Manage in the top right > add/remove roles, features, and add servers
Adding server
Open Server Manager > Manage > Add servers > FInd server > select > click arrow > say OK > server will appear under "All servers"
### Misconceptions
DNS, DHCP, IIS and File Server are not nessarily different servers

## 3: Roles and Features
### ONLY DO IF README SAYS SO
Active Directory Domain Services = enable
DNS server = enable
DHCP server = enable
File and storage services = enable
IIS = enable
print/document services = disable
remote access = disable

### Common features
SMB 1.0 = generally remove/disable
Windows Server backup = enable when functionally needed
BitLocker Drive Encryption = enable when required
Group Policy Management = enable when functionally needed
RSAT = enable when needed
Telnet = Generally disable

To enable:
Open Server Manager > Manage > select Add Roles and Features > Next > select server to change > Server Roles > Features > Next -> add > Restart
### Generally do this close to lunch, like updates
To remove
Open Server Manager > manage > select remove roles and features > Next > select server to change > server roles > features > next -> remove > restart
#### General Guide
Scroll thru Server Roles and Features and look for sus things
check what is enabled
find unnecessary things
research feature to see what it does
check readme before changing
If not required > disable
If required > enable
Note that some roles may be required; don't remove things because you don't know them

## 3: Configuring Tools

Guide: Open your own VM and add things you might find in comp; here we are going through the 3 most common ones

Config Forward:
Server Manage > Tools > NDS > expand sevrer > right-click foward loookup zones > Select new zone > Create > add/modify DNS records
Config Reverse:
R-C (right-click) Reverse lookup zones > new zone > ipv4 renerse lookup zone > network id > finish
Config DHCP:
After installing DHCP in roles/features > tools > dhcp > config ipv4 > config scope options > activate and verify
Config a ipv4 scope
R-C IPv4 > new scope > enter name > start and end IP > add exclusions > set lease duration
COnfig scope options




Installing web server IIS
open server manager > namage > add roles > choose role based or feature based > selectt server > IIS > add features > next > install
Create a Website
Server Manager > tools > IIS manager > R-C sites > add website > enter things > ok > stop if uses same port thingy
Config Settings and security
Application pools: set .net clr version and intergrated mode
permissions: give IIS AppPool/SiteName read access to folder
HTTPS:
Server certificates > import Cert.
Site > edit bindings > add > https, port 443
Test IIS:
Open firewall for ports 80 and 443 > browse site from another computer

403: missing default document or permissions
404: wrong path or file name
500: bad web.config or missing module
503: application pool stopped
Check Event Viewer and C:\inetpub\logs\logfiles for details
