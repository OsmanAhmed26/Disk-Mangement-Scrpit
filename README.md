# Disk-Mangement-Scrpit
How does it work:
Threshold Setting:

    Set the THRESHOLD variable to specify the disk usage percentage that triggers an alert.
    Example: THRESHOLD=80 means an alert is issued if disk usage exceeds 80%.

Disk Usage Check:

    Uses the df command to check the disk space usage of the root partition (/).
    Extracts the usage percentage using awk and sed.

Logging:

    Logs all disk usage checks to a file (disk_usage.log).
    Alerts are logged with a timestamp.

Error Handling:

    Verifies write permissions to the log file.
    Creates the log file if it doesn’t already exist.
