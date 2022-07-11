#!/usr/bin/env zsh

wid=$(xdotool search --name "ClickUp" | tail -n1)

# ClickUp
if [ -z $wid ]
then
    /opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=oiijllgnmcljlamimceompcdejbagfdl &>/dev/null &
else
    xdotool search --name "ClickUp" windowactivate

fi
