#!/bin/bash

## Check if log file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <nginx-access-log-file>"
        exit 1
        fi
#
        LOG_FILE="$1"
#
        if [ ! -f "$LOG_FILE" ]; then
            echo "Error: File '$LOG_FILE' not found."
                exit 2
                fi
#
                echo "========== NGINX Log Analysis =========="
                echo

                # Top 5 IP addresses
                echo "🔹 Top 5 IP addresses:"
                awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5
                echo

                # Top 5 requested paths
                echo "🔹 Top 5 requested paths:"
                awk -F\" '{print $2}' "$LOG_FILE" | awk '{print $2}' | sort | uniq -c | sort -nr | head -5
                echo
#
                # Top 5 response status codes
                echo "🔹 Top 5 response status codes:"
                awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5
                echo
#
                # Top 5 user agents
                echo "🔹 Top 5 user agents:"
                awk -F\" '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5
                echo
#
               echo "========================================"
#                
