#!/bin/bash
set -x

############################################
# DSI CONSULTING INC. Project setup script #
############################################
# This script creates standard analysis and output directories
# for a new project. It also creates a README file with the
# project name and a brief description of the project.
# Then it unzips the raw data provided by the client.

mkdir analysis output
touch README.md
echo "# Project Name: DSI Consulting Inc." > README.md
touch analysis/main.py

# download client data
curl -Lo rawdata.zip https://github.com/UofT-DSI/shell/raw/refs/heads/main/02_activities/assignments/rawdata.zip
unzip rawdata.zip

###########################################
# Complete assignment here

# 1. Create a directory named data
mkdir data
# 2. Move the ./rawdata directory to ./data/raw
mv rawdata data/raw
# 3. List the contents of the ./data/raw directory
ls data/raw

# 4. In ./data/processed, create the following directories: server_logs, user_logs, and event_logs
mkdir -p data/processed/server_logs
mkdir -p data/processed/user_logs
mkdir -p data/processed/event_logs
# 5. Copy all server log files (files with "server" in the name AND a .log extension) from ./data/raw to ./data/processed/server_logs
cp data/raw/server_*.log data/processed/server_logs
# 6. Repeat the above step for user logs and event logs
cp data/raw/event_*.log ./data/processed/event_logs
cp data/raw/user_*.log ./data/processed/user_logs
# 7. For user privacy, remove all files containing IP addresses (files with "ipaddr" in the filename) from ./data/raw and ./data/processed/user_logs
rm data/processed/user_logs/*ipaddr*
rm data/raw/*ipaddr*
# 8. Create a file named ./data/inventory.txt that lists all the files in the subfolders of ./data/processed
cd data
ls processed/event_logs/* >> inventory.txt
ls processed/server_logs/* >> inventory.txt
ls processed/user_logs/* >> inventory.txt
cd ..



###########################################

echo "Project setup is complete!"
