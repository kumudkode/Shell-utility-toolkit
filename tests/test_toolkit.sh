#!/bin/bash
# Shell Toolkit CI/CD Test Script
# Fully automated with progress bars, logging, proper exit codes

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

LOG_FILE="../test_results.log"
TIMEOUT_TOOLKIT=30
TIMEOUT_UTILS=10

declare -A SCRIPT_INPUTS
SCRIPT_INPUTS["../toolkit.sh"]=$'--test\n'
SCRIPT_INPUTS["../utils/backup.sh"]=$'--test\n'
SCRIPT_INPUTS["../utils/cleanup.sh"]=$'--test\n'
SCRIPT_INPUTS["../utils/network_check.sh"]=$'--test\n'
SCRIPT_INPUTS["../utils/service_check.sh"]=$'--test\n'
SCRIPT_INPUTS["../utils/log_monitor.sh"]=$'--test\n'
SCRIPT_INPUTS["../utils/system_info.sh"]=$'--test\n'
SCRIPT_INPUTS["../utils/disk_usage.sh"]=$'--test\n'
SCRIPT_INPUTS["../utils/memory_monitor.sh"]=$'--test\n'
SCRIPT_INPUTS["../utils/cpu_monitor.sh"]=$'--test\n'
SCRIPT_INPUTS["../utils/disk_alert.sh"]=$'--test\n'
SCRIPT_INPUTS["../utils/user_monitor.sh"]=$'--test\n'
SCRIPT_INPUTS["../utils/security_audit.sh"]=$'--test\n'
SCRIPT_INPUTS["../utils/log_analysis.sh"]=$'--test\n'

SCRIPTS=(../toolkit.sh ../utils/*.sh)

TOTAL=${#SCRIPTS[@]}
PASSED=0
FAILED=0
FAILED_SCRIPTS=()

progress_bar() {
    local current=$1
    local total=$2
    local width=30
    local progress=$(( current * width / total ))
    local remainder=$(( width - progress ))
    printf "["
    printf "%0.s#" $(seq 1 $progress)
    printf "%0.s-" $(seq 1 $remainder)
    printf "] %d%%" $(( current * 100 / total ))
}

log_result() {
    local script=$1
    local status=$2
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $script: $status" >> "$LOG_FILE"
}

echo -e "${CYAN}Running Shell Toolkit CI/CD Tests...${NC}"
> "$LOG_FILE"

for i in "${!SCRIPTS[@]}"; do
    script="${SCRIPTS[$i]}"
    printf "\nTesting %s " "$(basename $script)"
    progress_bar $((i)) $TOTAL
    echo -ne "\r"

    if [ -f "$script" ]; then
        input="${SCRIPT_INPUTS[$script]}"
        if [[ "$(basename $script)" == "toolkit.sh" ]]; then
            timeout $TIMEOUT_TOOLKIT bash "$script" <<< "$input" >/dev/null 2>&1
        else
            timeout $TIMEOUT_UTILS bash "$script" <<< "$input" >/dev/null 2>&1
        fi
        exit_code=$?

        if [ $exit_code -eq 0 ]; then
            echo -e "${GREEN}[PASS]${NC} $(basename $script)"
            PASSED=$((PASSED+1))
            log_result "$(basename $script)" "PASS"
        else
            echo -e "${RED}[FAIL]${NC} $(basename $script)"
            FAILED=$((FAILED+1))
            FAILED_SCRIPTS+=("$(basename $script)")
            log_result "$(basename $script)" "FAIL (exit code $exit_code)"
        fi
    else
        echo -e "${RED}[MISSING]${NC} $(basename $script)"
        FAILED=$((FAILED+1))
        FAILED_SCRIPTS+=("$(basename $script)")
        log_result "$(basename $script)" "MISSING"
    fi

    progress_bar $((i+1)) $TOTAL
    echo -ne "\r"
    sleep 0.2
done

echo -e "\n\n${CYAN}Test Summary:${NC}"
echo -e "Total Scripts Tested: $TOTAL"
echo -e "${GREEN}Passed: $PASSED${NC}"
echo -e "${RED}Failed: $FAILED${NC}"

if [ $FAILED -gt 0 ]; then
    echo -e "Failed Scripts: ${FAILED_SCRIPTS[*]}"
    exit 1  # CI/CD fails
fi

echo -e "${CYAN}Detailed log saved in $LOG_FILE${NC}"
exit 0
#!/bin/bash
TEST_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$TEST_DIR/.."

SCRIPTS=("$REPO_ROOT/toolkit.sh" "$REPO_ROOT/utils/"*.sh)
