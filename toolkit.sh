#!/bin/bash
# Shell Toolkit
# Author: YourName
# CI/CD Ready: --test mode for automation

# -------------------- Config --------------------
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$BASE_DIR/utils/system_info.sh"

TEST_MODE=false
if [[ "$1" == "--test" ]]; then
    TEST_MODE=true
fi

# Base directory (absolute path of toolkit.sh)
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# -------------------- Source Utils --------------------
source "$BASE_DIR/utils/system_info.sh"
source "$BASE_DIR/utils/disk_usage.sh"
source "$BASE_DIR/utils/memory_monitor.sh"
source "$BASE_DIR/utils/cpu_monitor.sh"
source "$BASE_DIR/utils/disk_alert.sh"
source "$BASE_DIR/utils/log_analysis.sh"
source "$BASE_DIR/utils/log_monitor.sh"
source "$BASE_DIR/utils/backup.sh"
source "$BASE_DIR/utils/cleanup.sh"
source "$BASE_DIR/utils/network_check.sh"
source "$BASE_DIR/utils/user_monitor.sh"
source "$BASE_DIR/utils/service_check.sh"
source "$BASE_DIR/utils/security_audit.sh"

# -------------------- Menu --------------------
menu() {
    echo "================== Shell Toolkit =================="
    echo "1) System Info"
    echo "2) Disk Usage"
    echo "3) Memory Monitor"
    echo "4) CPU Monitor"
    echo "5) Disk Alert"
    echo "6) Log Analysis"
    echo "7) Log Monitor"
    echo "8) Backup"
    echo "9) Cleanup"
    echo "10) Network Check"
    echo "11) User Monitor"
    echo "12) Service Check"
    echo "13) Security Audit"
    echo "14) Exit"
    echo "==================================================="
}

# -------------------- Run Toolkit --------------------
run_tool() {
    if $TEST_MODE; then
        MENU_CHOICES=(1 2 3 4 5 6 7 8 9 10 11 12 13 14)
    else
        while true; do
            menu
            read -p "Enter your choice: " choice
            MENU_CHOICES=("$choice")
            break
        done
    fi

    for choice in "${MENU_CHOICES[@]}"; do
        case $choice in
            1) system_info_function ;;
            2) disk_usage_function ;;
            3) memory_monitor_function ;;
            4) cpu_monitor_function ;;
            5) disk_alert_function ;;
            6) log_analysis_function ;;
            7) log_monitor_function ;;
            8) backup_function ;;
            9) cleanup_function ;;
            10) network_check_function ;;
            11) user_monitor_function ;;
            12) service_check_function ;;
            13) security_audit_function ;;
            14) exit 0 ;;
            *) echo "Invalid choice" ;;
        esac
    done
}

# -------------------- Start --------------------
run_tool
