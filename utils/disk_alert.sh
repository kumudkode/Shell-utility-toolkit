#!/bin/bash
disk_alert_function() {
    echo "=== Disk Alert ==="
    THRESHOLD=90
    usage=$(df / | tail -1 | awk '{print $5}' | tr -d '%')
    echo "Current usage: $usage%"
    if (( usage > THRESHOLD )); then
        echo "WARNING: Disk usage above $THRESHOLD%"
    else
        echo "Disk usage normal."
    fi
    if [[ "$1" == "--test" ]] || [[ "$TEST_MODE" == true ]]; then
        echo "[TEST MODE] Skipping email/alert"
    else
        read -p "Press Enter to continue..."
    fi
}
