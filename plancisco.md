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


