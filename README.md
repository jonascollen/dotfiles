## Dotfiles

This is my attempt on setting up a nice work enviroment on a rather closed system and also getting rid of SecureCRT to something more... pretty.
I spend most of my days jumping between network devices of different brands and some coding so I needed something universal that could handle multiple tabs.

Somehow ended up using Windows Terminal and WSL2/Ubuntu instead. Due to my account not having sudo rights on the bastion I work from everything else needs to be installed/compiled locally. 
The only thing I still miss from SecureCRT is the ability to clone a live ssh session (no login-prompt for the new tab) but I've managed to live without it.

Other features I liked that I've replace somewhat:

* Working with multiple tabs/sessions etc - Tmux
* Syntax highlighting in network deviecs - ChromaTerm


## Problems along the way 

Some major problems I ran into and my dirty workarounds.. 

### Exiting Console-sessions

Due to what I guess is a bug Windows Terminal does not send the correct escape sequence for exiting console sessions to a Cisco device (requires sending "Ctrl + Shift + 6" & "x" / Ctrl + ^  x).
They do however allow you to keybind and send ansi escape codes yourself so I made this keybind as a workaround:

```
"command": 
{
    "action": "sendInput",
    "input": "\u001e"
},
"keys": "f5"
```

So hitting f5 and then "x" allows me to terminate sessions.


### Backspace not working in Huawei-devices inside a Tmux-session

Another weird one, inside a tmux session normal backspace does not work in Huwaei-routers for me. Huawei expects "Ctrl + H" as backspace sequence (same as other devices I work with) so I made this keybind in .tmux.conf instead:

```
bind-key -n Bspace send-keys C-h
```

### DNS and VPN

Due to a bug in WSL2/Ubuntu DNS stops working if you connect or disconnect a VPN-session in Windows (the DNS-servers are not replaced).
My workaround was creating two etc/resolv.conf, one pointing to my own DNS and one pointing to my companys internal DNS. I then call a simple python-script with vpn on / off depending of how i'm currently connected.

```
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
```


