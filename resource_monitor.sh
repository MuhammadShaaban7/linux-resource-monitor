#!/bin/bash

# Script to monitor CPU, Memory, and Disk usage on a Linux system

# Get the current date and time
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Get CPU usage (percentage)
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)

# Get Memory usage (free and total)
MEM_TOTAL=$(free -m | grep "Mem:" | awk '{print $2}')
MEM_USED=$(free -m | grep "Mem:" | awk '{print $3}')
MEM_PERCENT=$((MEM_USED * 100 / MEM_TOTAL))

# Get Disk usage (percentage)
DISK_USAGE=$(df -h / | grep "/" | awk '{print $5}' | cut -d% -f1)

# Create a report
REPORT_FILE="resource_report.txt"

echo "Resource Monitor Report - $TIMESTAMP" > $REPORT_FILE
echo "--------------------------------" >> $REPORT_FILE
echo "CPU Usage: $CPU_USAGE%" >> $REPORT_FILE
echo "Memory Usage: $MEM_USED MB / $MEM_TOTAL MB ($MEM_PERCENT%)" >> $REPORT_FILE
echo "Disk Usage: $DISK_USAGE%" >> $REPORT_FILE

# Print the report to the terminal
cat $REPORT_FILE

echo "Report saved to $REPORT_FILE"
