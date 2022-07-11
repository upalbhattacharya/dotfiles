#!/usr/bin/env zsh

wid=$(xdotool search --name "Todoist" | tail -n1)

# Todoist
if [ -z $wid ]
then
    /opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=ldmnmnoaidepdpbdbjnmkmjbmbajopbg &>/dev/null &
else
    xdotool search --name "Todoist" windowactivate
fi
