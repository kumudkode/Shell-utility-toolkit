#!/bin/bash
user_monitor_function() {
    echo "=== User Monitor ==="
    who
    if [[ "$1" == "--test" ]] || [[ "$TEST_MODE" == true ]]; then
        echo "[TEST MODE] Skipping additional input"
    else
        read -p "Press Enter to continue..."
    fi
}
