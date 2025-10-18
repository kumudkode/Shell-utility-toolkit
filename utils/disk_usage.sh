#!/bin/bash
disk_usage_function() {
    echo "=== Disk Usage ==="
    df -h
    if [[ "$1" == "--test" ]] || [[ "$TEST_MODE" == true ]]; then
        echo "[TEST MODE] Skipping interactive commands"
    else
        read -p "Press Enter to continue..."
    fi
}
