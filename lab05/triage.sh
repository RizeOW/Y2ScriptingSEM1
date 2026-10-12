#!/bin/bash

CASE_DIR="case"
REPORT="triage-report-auto.txt"

read -p "Enter analyst name: " ANALYST
read -p "Enter case reference: " CASE_REF

echo "CASE TRIAGE REPORT" > "$REPORT"
echo "Analyst: $ANALYST" >> "$REPORT"
echo "Case reference: $CASE_REF" >> "$REPORT"
echo "Date: $(date)" >> "$REPORT"
echo "" >> "$REPORT"

TOTAL_FILES=$(find "$CASE_DIR" -type f | wc -l)
TOTAL_DIRS=$(find "$CASE_DIR" -type d | wc -l)
PYTHON_FILES=$(find "$CASE_DIR" -type f -name "*.py" | wc -l)
SHELL_SCRIPTS=$(find "$CASE_DIR" -type f -name "*.sh" | wc -l)
LOG_FILES=$(find "$CASE_DIR" -type f -name "*.log" | wc -l)

# Adjust this pattern to match the configuration-file definition in Lab 4.
CONFIG_FILES=$(find "$CASE_DIR" -type f \( -name "*.conf" -o -name "*.cfg" -o -name "*.ini" \) | wc -l)

EMPTY_FILES=$(find "$CASE_DIR" -type f -empty | wc -l)

# Adjust this pattern to match the archive-file definition in Lab 4.
ARCHIVES=$(find "$CASE_DIR" -type f \( -name "*.zip" -o -name "*.tar" -o -name "*.gz" \) | wc -l)

echo "Total Files: $TOTAL_FILES" >> "$REPORT"
echo "Total Directories: $TOTAL_DIRS" >> "$REPORT"
echo "Python Files: $PYTHON_FILES" >> "$REPORT"
echo "Shell Scripts: $SHELL_SCRIPTS" >> "$REPORT"
echo "Log Files: $LOG_FILES" >> "$REPORT"
echo "Configuration Files: $CONFIG_FILES" >> "$REPORT"
echo "Empty Files: $EMPTY_FILES" >> "$REPORT"
echo "Archives: $ARCHIVES" >> "$REPORT"

echo "" >> "$REPORT"
echo "Files containing admin:" >> "$REPORT"
grep -rl "admin" "$CASE_DIR" >> "$REPORT"

echo "" >> "$REPORT"
echo "Detected evidence file types:" >> "$REPORT"
find "$CASE_DIR/evidence" -type f -exec file {} \; >> "$REPORT"

SCRIPTS=$((PYTHON_FILES + SHELL_SCRIPTS))
echo "" >> "$REPORT"
echo "Scripts (Python + shell): $SCRIPTS" >> "$REPORT"

echo "Report written to $REPORT"
