more cisco

# Data and voice VLANs
- an access port can only be assigned to one data VLAN, but it can also be assigned one Voice VLAN for when a phone and end device are connected on the same switch port
- `S1# configure terminal` - enter global config mode
- `S1(config)# interface interface_id` enter interface config mode
- `S1(config-if)# switchport mode trunk`
- `S1(config-if)# switchport trunk native vlan <id>`
- `S1(config-if)#`

# DTP modes
- **Access** - permanent access mode and negotiates to convert the neighboring link into an access link
- **Dynamic Auto** - will become a trunk if the neighboring interface is set to turnk or desirable mode
- **Dynamic Desirable** - actively seeks to become a trunk by negotiating
- **Trunk** - perm trunking mode and negotiates to convert neighboring link into a trunk link

# IP Addressing
- ip addresses are used a the network layr and are the logica address associated with a computer's network interface
- they are used for comms outside network
- they can change and arent specific to a given system
