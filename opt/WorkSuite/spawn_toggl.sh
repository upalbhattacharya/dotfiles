#!/usr/bin/env zsh

wid=$(xdotool search --name "Toggl Track" | tail -n1)

# ClickUp
if [ -z $wid ]
then
    /opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=chpiljhfemlfpnfoohpbokdofonkiifm &>/dev/null &
else
    xdotool search --name "Toggl Track" windowactivate

fi
