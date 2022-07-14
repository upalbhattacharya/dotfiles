#!/usr/bin/env zsh

wid=$(xdotool search --name "Kindle" | tail -n1)

# ClickUp
if [ -z $wid ]
then
    /opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=nbbfcngpacggngollfgelcckchlmhecc &>/dev/null &
else
    xdotool search --name "Kindle" windowactivate

fi
