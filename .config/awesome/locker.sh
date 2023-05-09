#!/usr/bin/env sh

# Run xidlehook
xidlehook \
    --detect-sleep \
    --not-when-fullscreen \
    --not-when-audio \
    --timer 270 \
    'notify-send "Lockscreen" "System will enable lockscreen in 30 seconds" ' \
    '' \
    --timer 30 \
    'betterlockscreen --lock' \
    '' \
    --timer 300 \
    'systemctl suspend' \
    ''
