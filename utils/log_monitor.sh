#!/bin/bash
log_monitor_function() {
    echo "=== Log Monitor ==="
    LOG_FILE="/var/log/syslog"
    if [[ "$1" == "--test" ]] || [[ "$TEST_MODE" == true ]]; then
        echo "[TEST MODE] Skipping tail -f"
    else
        tail -f "$LOG_FILE"
    fi
}
