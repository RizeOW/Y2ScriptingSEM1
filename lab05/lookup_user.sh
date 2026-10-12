#!/bin/bash

read -p "Enter a username to look up: " TARGET_USER
read -p "Enter a department to search for: " TARGET_DEPT

echo "Searching for username: $TARGET_USER"
grep "$TARGET_USER" intel/users.csv

echo ""
echo "Searching for department: $TARGET_DEPT"
grep "$TARGET_DEPT" intel/users.csv
