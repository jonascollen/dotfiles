# Workaround for issues with DNS not working in WSL2/Ubuntu if going on/off a VPN-connection to my work. 
# Manually calling script with vpn on / vpn off for now until issue is fixed.

import os
import sys

setting = sys.argv[1]
os.system("sudo chattr -i /etc/resolv.conf")

if setting == "on":
    os.system('sudo cp /etc/resolv.conf.vpn /etc/resolv.conf')
    print("DNS for VPN activated.")
elif setting == "off":
    os.system('sudo cp /etc/resolv.conf.novpn /etc/resolv.conf')
    print("DNS for disconnected VPN activated.")
