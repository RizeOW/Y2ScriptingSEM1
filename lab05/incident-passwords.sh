#!/bin/bash

read -p "Enter username: " USERNAME
read -s -p "Enter password: " PASSWORD

echo ""
echo "Username: $USERNAME"
echo "Password length: ${#PASSWORD} characters"
