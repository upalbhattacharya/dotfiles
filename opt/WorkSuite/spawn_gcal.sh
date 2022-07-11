#!/usr/bin/env zsh

wid=$(xdotool search --name "Google Calendar" | tail -n1)

# Google Calendar
if [ -z $wid ]
then
    /opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=kjbdgfilnfhdoflbpgamdcdgpehopbep &>/dev/null &

else
    xdotool search --name "Google Calendar" windowactivate
fi
