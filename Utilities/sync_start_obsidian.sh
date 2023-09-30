#!/usr/bin/env sh

graceful_exit() {
    echo "Exiting by uploading to remote"
    local VAULT_PATH="/home/workboots/Vaults"
    cd "$VAULT_PATH"
    if [ $(git status --porcelain | wc -l) -ne 0 ]; then
        echo "$(date +"%Y-%m-%d %H:%M:%S %z") $(git status --porcelain)" >> /tmp/obsidian.log
        git add .
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

# Sync with remote
if [ $(git status --porcelain | wc -l) -ne 0 ]; then
    echo "$(date +"%Y-%m-%d %H:%M:%S %z") $(git status --porcelain)" > /tmp/obsidian.log
    git add .
    git commit -q -m "Arch Sync: $(date +"%Y-%m-%d %H:%M:%S %z")"
    git stash
    git pull
    git apply stash
    git push
else
    git pull
fi

# Create log file if it does not exist
touch /tmp/obsidian.log

# Start Obsidian and detach
/usr/bin/obsidian > /dev/null 2>&1 &

# Get PID of started process
OBSIDIAN_PID="$!"

# Push Changes every 5 minutes
while [ $(ps -a | grep "$OBSIDIAN_PID" | wc -l) -ne 0 ]
do
    i=$(($i+1))
    # Check Changes. Log and commit only if there are changes.
    if [ "$(($i % $INTERVAL ))" -eq 0 ] && [ $(git status --porcelain | wc -l) -ne 0 ]; then
        echo "$(date +"%Y-%m-%d %H:%M:%S %z") $(git status --porcelain)" >> /tmp/obsidian.log
        git add .
        git commit -q -m "Arch Sync: $(date +"%Y-%m-%d %H:%M:%S %z")"
        git push
    fi
    sleep 1s
done

# Clear log
echo "" > /tmp/obsidian_inotify.log

# Commit Changes on exit
git status
git add .
git commit -q -m "Arch Sync: $(date +"%Y-%m-%d %H:%M:%S %z")"
git push
