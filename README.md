# cdt_homework4
This script works by adding rules to Windows firewall to block ports used by common network services.
Every five minutes it will randomly block the ports used by two common network services. It only blocks 
two at a time in order to reduce the risk of detection. It is intended to be used in red/blue team competitions. 
To use this script you will need to get it onto the target machine with admin access and then run it, no
other input is required.
