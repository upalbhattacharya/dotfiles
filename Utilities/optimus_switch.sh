#!/usr/bin/env sh

# Script to switch to nvidia on first boot
# IMPORANT: Only use after first boot

echo "Running prime-offload"
prime-offload
echo "Completed. Running optimus-manager to switch to $1"
optimus-manager --switch "$1" --no-confirm
echo "Completed. Running prime-switch with root privileges"
sudo prime-switch
echo "Completed. You may now run startx with logging"
