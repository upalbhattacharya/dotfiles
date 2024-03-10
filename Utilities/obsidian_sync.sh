#!/usr/bin/env sh

# Obsidian Git Sync

VAULT_PATH="/home/workboots/Vaults"
PWD="$(pwd)"

cd "$VAULT_PATH"

git add --all
git commit -q -m "Arch Sync: $(date +"%Y-%m-%d %T %z")"
git fetch
git merge --no-edit
git add --all
git commit -q -m "Arch Automerge Sync: $(date +"%Y-%m-%d %T %z")"
git push

cd "$PWD"
