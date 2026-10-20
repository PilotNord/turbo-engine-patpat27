# Even more Ciscoooooo
## Duplex communication
- full-duplex communication increases bandwidth efficiency by allowing both ends to transmit data simultaneously
## Physical Layer Config
- speed and duplex settings can be assigned to ports using the speed and duplex commands
- `S1# configure terminal`
- `S1(config-if)# duplex full`
- `S1(config)# interface FastEthernet 0/1`
## SSH config
- `S1(config)# ip domain-name <device-name>` - provides a domain name
- `S1(config)# crypto key generate rsa`
- `S1(config)# username user pass`
- `S1(config)# line vty 0 4`
## MAC address table
- switches use the destination MAC address to determine the egress interface
- before doing this a switch must learn where the destination is located
- a switch builds a MAC address table (CAM table) by recording the source MAC
## Forwarding methods
- store and forward: switch receives the entire frame computes the CRC value, determines the outgoing interface, and then forwards the data
- cut-through: the switch forwards the frame before it is entirely received
## VLANs
- default VLAN: VLAN 1
- data VLAN: user-generated traffic
- native VLAN: trunk links
- management VLAN: VTY traffic
- voice VLAN: QoS
## Trunk ports
- a trunk is a point-to-point link between two network devices. they allow more than one VLAN, extend the VLAN network, (didnt have enough time to finish dis one)
