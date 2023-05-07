#!/bin/sh

exec xautolock -detectsleep \
    -time 5 -locker "betterlockscreen -l" \
    -notify 30 \
    -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'"


