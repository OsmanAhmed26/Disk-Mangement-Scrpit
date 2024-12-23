#!/bin/bash

# Set the disk usage threshold (percentage)
THRESHOLD=80
LOG_FILE=disk_usage.log

# Function to check disk usage and alert if it exceeds the threshold
check_disk_space() {
    # Get the disk usage percentage for the root partition
    DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

    # Log the current disk usage
    echo "$(date): Disk usage is at ${DISK_USAGE}%." >> "$LOG_FILE"

    # Compare disk usage with the threshold
    if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
        echo "$(date): ALERT! Disk usage is above ${THRESHOLD}%. Current usage: ${DISK_USAGE}%." | tee -a "$LOG_FILE"
    else
        echo "$(date): Disk usage is under control." >> "$LOG_FILE"
    fi
}

# Main script execution
if [ -w "$LOG_FILE" ] || [ ! -f "$LOG_FILE" ]; then
    # Create the log file if it doesn't exist
    touch "$LOG_FILE"
    check_disk_space
else
    echo "Error: Cannot write to the log file ($LOG_FILE). Check permissions." >&2
    exit 1
fi

