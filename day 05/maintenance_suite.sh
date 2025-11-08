#!/bin/bash
# maintenance_suite.sh - Enhanced Bash System Maintenance Suite (with Logging & Error Handling)

# === LOG FILE ===
MAIN_LOG="/home/$USER/backup/maintenance_log.txt"
mkdir -p "/home/$USER/backup"
touch "$MAIN_LOG"

# === SCRIPT PATHS ===
BACKUP_SCRIPT="./backup.sh"
UPDATE_SCRIPT="./system_update.sh"
LOG_MONITOR_SCRIPT="./log_monitor.sh"

# === FUNCTION: log messages ===
log() {
    echo "[$(date +%Y-%m-%d_%H-%M-%S)] $1" | tee -a "$MAIN_LOG"
}

# === FUNCTION: run script safely ===
run_script() {
    local script="$1"
    local description="$2"

    if [ ! -f "$script" ]; then
        log "❌ ERROR: Missing script $script"
        echo "Script not found!"
        return 1
    fi

    log "▶️ Starting: $description"
    bash "$script"
    if [ $? -eq 0 ]; then
        log "✅ SUCCESS: $description completed successfully."
    else
        log "⚠️ FAILURE: $description encountered an error."
    fi
    echo "--------------------------------------"
    read -p "Press Enter to return to menu..."
}

# === MAIN MENU LOOP ===
while true; do
    clear
    echo "======================================"
    echo " 🧰  SYSTEM MAINTENANCE SUITE (FINAL)"
    echo "======================================"
    echo "[1] Perform System Backup";
    echo "[2] Run System Update & Cleanup";
    echo "[3] Monitor System Logs";
    echo "[4] View Maintenance Log";
    echo "[5] Exit";
    echo "--------------------------------------"
    read -p "👉 Enter your choice [1-5]: " choice

    case $choice in
        1)
            run_script "$BACKUP_SCRIPT" "System Backup"
            ;;
        2)
            run_script "$UPDATE_SCRIPT" "System Update & Cleanup"
            ;;
        3)
            run_script "$LOG_MONITOR_SCRIPT" "System Log Monitoring"
            ;;
        4)
            echo "📜 Showing Maintenance Log:"
            echo "--------------------------------------"
            cat "$MAIN_LOG"
            echo "--------------------------------------"
            read -p "Press Enter to return to menu..."
            ;;
        5)
            log "👋 Exiting the maintenance suite."
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "⚠️  Invalid choice. Please try again."
            sleep 2
            ;;
    esac
done