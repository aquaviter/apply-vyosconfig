# Automatic VPN configuration for vyos

This scripts are capable of applying configuration in order to establish VPN connection between VGW(Virtual Private Gateway) and vyos for inter-region connectivity.

## Quick Start

1. Clone this repository. 
2 .Download VPN configuration from AWS Management Console.
3. Launch vyos instance from AMI.
4. Run script.

## Usage this script

```
./apply_vpnconfig.sh <ssh key path> <FQDN> <config file>
```

