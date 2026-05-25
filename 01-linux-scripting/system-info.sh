#!/bin/bash

echo "====SYSTEM INFO====="
echo "Hostname:: $(hostname)"
echo "Current User: $(whoami)"
echo "Current Date: $(date)"
echo

echo "======UPTIME========"
uptime
echo

echo "======DISK USAGE========"
df -h
echo

echo "========MEMORY USAGE======"
free -h

echo "======TOP 5 PROCESSES BY MEMORY========"
ps aux --sort=-%mem | head -n 6