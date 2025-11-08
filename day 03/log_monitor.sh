#!/bin/bash
# log_monitor.sh - System Log Monitoring Script

# === CONFIGURATION ===
LOG_FILE="/var/log/syslog"                           # System log file
REPORT_DIR="/home/$USER/backup/log_reports"          # Folder to store reports
REPORT_FILE="$REPORT_DIR/log_report_$(date +%Y-%m-%d_%H-%M-%S).txt"

# === CREATE REPORT DIRECTORY IF NOT EXISTS ===
mkdir -p "$REPORT_DIR"

# === MONITOR LOG FILE FOR KEYWORDS ===
echo "🔍 Scanning $LOG_FILE for issues..."

grep -iE "error|fail|warning" "$LOG_FILE" > "$REPORT_FILE"

# === CHECK IF ANY MATCHES FOUND ===
if [ -s "$REPORT_FILE" ]; then
    echo "⚠️  Issues found! Report saved at: $REPORT_FILE"
    echo "=============================="
    tail -n 10 "$REPORT_FILE"     # Show last 10 log issues
else
    echo "✅ No critical issues found in logs."
    rm "$REPORT_FILE"             # Delete empty report
fi