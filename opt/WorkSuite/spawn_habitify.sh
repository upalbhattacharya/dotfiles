#!/usr/bin/env zsh

wid=$(xdotool search --name "Habitify" | tail -n1)

# Habitify
if [ -z $wid ]
then
    /opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=ileccekomdaoakenikloabijljhgiacl &>/dev/null &
else
    xdotool search --name "Habitify" windowactivate
fi
