#!/bin/bash
backup_function() {
    local SRC DEST
    if [[ "$1" == "--test" ]] || [[ "$TEST_MODE" == true ]]; then
        SRC="/tmp"
        DEST="/tmp/test_backup"
    else
        read -p "Enter source folder: " SRC
        read -p "Enter destination folder: " DEST
    fi
    echo "Backing up $SRC to $DEST..."
    mkdir -p "$DEST"
    cp -r "$SRC"/* "$DEST/" 2>/dev/null
}
