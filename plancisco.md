------
# Beginning of Competition
* Correct team ID
* Start with forensics.
# During Comp.
* Work through checklist, basically, run updates during lunch.
* Updates *downloaded* before Forensics.
# List of some stuff
* Delete/add/edit users and groups
* Give/change passwords
* Password policies.
* Enable/disable services
* Secure software
* Remove programs
* Run updates.

# Cisco
* Cisco Quiz
* Lookup questions, bro.
* Packet Tracer for 3 hours...
* Work through it systematically
* Packet Tracer is difficult.

# Forensics And More Cisco
## Command Modes
* Allow for separate levels in which you can send commands into.
  * Uses identifiers to tell what state you are in.
  * Modes have exclusive commands.
* User, enable, Global, Line console, Line vtv, Interface
## Command Structure
* Required!!!
* Uses a keyword and argument, always.
* <insert flowchart here of the Prompt, Command, Space, Keywords or Arguments>

## Basic Commands
- no <command>
- do <command>
- show <file>
- enable
- configure terminal
- interface <port/number>
- reload

- hostname <name>
- copy <source>
- write erase
- erase startup-config
- ip address
- shutdown
- ip default-gateway <ip-address>

- ping
- show running-config
- show ip interface interface
- show interfaces
- show vlan
- show vtp status

## Password Commands
- `username <name> password <value>` - changes username and pass
- `enable password <value` 
- `enable secret <value>`
- `service password-encryption`

## IP Adressing
- ipv4, ipv6
- can be set manually or automatically
- consist of an address, subnet mask, and default gateway
- process called ANDing to know what network they belong to
- default gateway is the outward route of the network (usually router)

## Subnetting
- creating sub-networks from a given network. borrows bits from the host portion of provided network
- formula is 2^Y (y=borrowed bits needed)
- passwords can be adjusted from the #(config) mode using `enable password` or `enable secret`
- passwords are unencrypted and are encrypted with `service password-encryption`
- secrets are always encrypted (wow didnt know that)

## Banner Messages
- banner messages warn unauthorized personnel about attempting to access the device
- `banner motd`
- use delimiter to type message

## Saving Config files
- config files store everything on the system
- 2 files exist being `startup-config` and

## VLAN Config
- to access a switch remotely it must haven an IP address and a subnet mask
- to give a switch an IP address a VLAN must be used
- after assigning it an IP, the port must be opened

## Basic Config
- all the basic switch foniguration requirements also apply to routers
- routers have additional requirements such as ip addresses and default gateways
- routers do not use VLANs
- interfaces are shut down by default. use `no shut` to activate
- provide a desc for them to add info about the network
- switches have interfaces but no ips
- use ipv4 or ipv6 based on requirements
- end devices and switches utilize default gateways to know where to route information
- usually the default gateway is local router

## Management Access
- for switches to have remote access they need to have an IP address and a subnet mask
- managment is controlled through vlan 1 by default with all ports being assigned to vlan 1
- switch virtual interfaces are logical interfaes that dont show up until a device is connected to the vlan
- you should use a vlan aside from vlan 1

## SVI config commands
- `S1# configure terminal` enter global config mode
- `S1(config)# interface vlan 99` enter the SVI's interface configuration mode
- `S1(config-if)# ip address 10.0.0.2 255.255.255.0`  configure ipv4
- `S1(config-if)# ipv6 address 2001:db8:acd:1::1/64`
- `S1(config-if)# no shutdown` - enables interface
- `S1(config-if)# end` - returns to priveleged EXEC mode
- `S1# copy running-config startup-config` saves config
- `S1(config)# ip-default-gateway 10.0.0.1`
