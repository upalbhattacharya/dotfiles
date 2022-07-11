#!/usr/bin/env zsh

wid=$(xdotool search --name "WhatsApp" | tail -n1)

# WhatsApp
if [ -z $wid ]
then
    /opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=hnpfjngllnobngcgfapefoaidbinmjnm &>/dev/null &
else
    xdotool search --name "WhatsApp" windowactivate
fi
