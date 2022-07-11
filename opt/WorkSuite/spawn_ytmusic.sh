#!/usr/bin/env zsh

wid=$(xdotool search --name "YouTube Music" | tail -n1)

# ClickUp
if [ -z $wid ]
then
    /opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=cinhimbnkkaeohfgghhklpknlkffjgod &>/dev/null &
else
    xdotool search --name "YouTube Music" windowactivate

fi
