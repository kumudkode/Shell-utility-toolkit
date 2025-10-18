#!/bin/bash
log_analysis_function() {
    echo "=== Log Analysis ==="
    LOG_FILE="/var/log/syslog"
    if [[ ! -f $LOG_FILE ]]; then
        echo "Log file $LOG_FILE not found."
    else
        tail -n 10 "$LOG_FILE"
    fi
    if [[ "$1" == "--test" ]] || [[ "$TEST_MODE" == true ]]; then
        echo "[TEST MODE] Skipping interactive log review"
    else
        read -p "Press Enter to continue..."
    fi
}
