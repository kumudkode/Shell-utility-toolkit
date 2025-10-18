#!/bin/bash
cleanup_function() {
    local DIR
    if [[ "$1" == "--test" ]] || [[ "$TEST_MODE" == true ]]; then
        DIR="/tmp/test_backup"
    else
        read -p "Enter folder to cleanup: " DIR
    fi
    echo "Cleaning up $DIR..."
    rm -rf "$DIR"/*
}
