#!/usr/bin/env zsh

wid=$(xdotool search --name "Telegram Web" | tail -n1)

# Telegram Web
if [ -z $wid ]
then
    /opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=majiogicmcnmdhhlgmkahaleckhjbmlk &>/dev/null &
else
    xdotool search --name "Telegram Web" windowactivate
fi
