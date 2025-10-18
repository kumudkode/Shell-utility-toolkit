#!/bin/bash
cpu_monitor_function() {
    echo "=== CPU Monitor ==="
    top -b -n1 | head -n 10
    if [[ "$1" == "--test" ]] || [[ "$TEST_MODE" == true ]]; then
        echo "[TEST MODE] Skipping interactive commands"
    else
        read -p "Press Enter to continue..."
    fi
}
