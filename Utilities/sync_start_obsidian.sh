#!/usr/bin/env sh

graceful_exit() {
    echo "Exiting by uploading to remote"
    local VAULT_PATH="/home/workboots/Vaults"
    cd "$VAULT_PATH"
    if [ $(git status --porcelain | wc -l) -ne 0 ]; then
        echo "$(date +"%Y-%m-%d %H:%M:%S %z") $(git status --porcelain)" >> /tmp/obsidian.log
        git add --all
        git commit -q -m "Arch Sync: $(date +"%Y-%m-%d %H:%M:%S %z")"
        git push
    else
        echo "No changes. Exiting"
    fi

    exit 1
    }
trap 'graceful_exit' SIGTERM SIGKILL SIGINT
# Use counter to save and exit immediately
i=0

# Interval (in seconds)
INTERVAL=300

# Execute a sync with remote before launching
VAULT_PATH="/home/workboots/Vaults"

cd "$VAULT_PATH"

# Provide notification
notify-send -u normal "Obsidian Sync" "Syncing with remote. Starting Obsidian after sync is complete"

# Sync with remote
if [ $(git status --porcelain | wc -l) -ne 0 ]; then
    echo "$(date +"%Y-%m-%d %H:%M:%S %z") $(git status --porcelain)" >> /tmp/obsidian.log
    git add --all
    git commit -q -m "Arch Sync: $(date +"%Y-%m-%d %H:%M:%S %z")"
    git fetch
    git merge --no-edit
    git add --all
    git commit -q -m "Arch Automerge Sync: $(date +"%Y-%m-%d %H:%M:%S %z")"
    git push >> /tmp/obsidian.log
else
    git fetch
    git merge --no-edit
    git commit -q -m "Arch Automerge Sync: $(date +"%Y-%m-%d %H:%M:%S %z")"
    git push >> /tmp/obsidian.log
fi

# Create log file if it does not exist
touch /tmp/obsidian.log

# Start Obsidian and detach
/home/workboots/AppImages/Obsidian-1.5.8.AppImage --ozone-platform=wayland --enable-features=UseOzonePlatform,WaylandWindowDecorations > /dev/null 2>&1 &
# Get PID of started process
OBSIDIAN_PID="$!"

# Push Changes every 5 minutes
while [ $(ps -a | grep "$OBSIDIAN_PID" | wc -l) -ne 0 ]
do
    i=$(($i+1))
    # Check Changes. Log and commit only if there are changes.
    if [ "$(($i % $INTERVAL ))" -eq 0 ] && [ $(git status --porcelain | wc -l) -ne 0 ]; then
        echo "$(date +"%Y-%m-%d %H:%M:%S %z") $(git status --porcelain)" >> /tmp/obsidian.log
        git add --all
        git commit -q -m "Arch Sync: $(date +"%Y-%m-%d %H:%M:%S %z")"
        git fetch
        git merge --no-edit
        git status >> /tmp/obsidian.log
        git add --all
        git commit -q -m "Arch Automerge Sync: $(date +"%Y-%m-%d %H:%M:%S %z")"
        git push >> /tmp/obsidian.log
    fi
    sleep 1s
done
# Give time to let changes persist ??
sleep "$INTERVAL"
# Commit Changes on exit
echo "$(date +"%Y-%m-%d %H:%M:%S %z") $(git status --porcelain)" >> /tmp/obsidian.log
git add -A .
git commit -q -m "Arch Sync: $(date +"%Y-%m-%d %H:%M:%S %z")"
git push >> /tmp/obsidian.log

exit 0
