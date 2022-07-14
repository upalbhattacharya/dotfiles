#!/usr/bin/env zsh

wid=$(xdotool search --name "ActivityWatch" | tail -n1)

# ClickUp
if [ -z $wid ]
then
    /opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=ojllpfojohmmaonphfljameiilmfhpfd &>/dev/null &
else
    xdotool search --name "ActivityWatch" windowactivate

fi
