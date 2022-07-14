#!/usr/bin/env zsh

wid=$(xdotool search --name "Google Podcasts" | tail -n1)

# ClickUp
if [ -z $wid ]
then
    /opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=dmdbbkhbicedkecamhghgmcpdlepaflj &>/dev/null &
else
    xdotool search --name "Google Podcasts" windowactivate

fi
