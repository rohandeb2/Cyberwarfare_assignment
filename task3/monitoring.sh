#!/bin/bash


CONTAINER_NAME="webapp"
LOG_DIR="/opt/container-monitor/logs"
LOG_FILE="$LOG_DIR/monitor_$(date +%Y-%m-%d).log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

mkdir -p "$LOG_DIR" 

STATUS=$(docker inspect --format='{{.State.Status}}' "$CONTAINER_NAME" 2>/dev/null)

if [ "$STATUS" != "running" ]; then
    echo "[$TIMESTAMP] ERROR: Container '$CONTAINER_NAME' is not running. Status: ${STATUS:-not found}" >> "$LOG_FILE"
    exit 1
fi

STATS=$(docker stats "$CONTAINER_NAME" --no-stream --format "{{.CPUPerc}},{{.MemUsage}},{{.MemPerc}}")

CPU=$(echo "$STATS"    | cut -d',' -f1)
MEM_USAGE=$(echo "$STATS" | cut -d',' -f2)
MEM_PERC=$(echo "$STATS"  | cut -d',' -f3)

echo "[$TIMESTAMP] Container: $CONTAINER_NAME | CPU: $CPU | Memory: $MEM_USAGE ($MEM_PERC)" >> "$LOG_FILE"

echo "Log written to $LOG_FILE"
