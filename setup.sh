#!/bin/bash

#remove zip file (not required anymore)
rm -rf ./AutoGen-Search.zip

# Creating a virtual environment
echo "Setting up virtual environment ..."
python3 -m venv venv  # Corrected 'pyhton3' to 'python3'

# Activating the virtual environment
source ./venv/bin/activate  # Changed '.venv' to 'venv' to match the directory created
# It's good practice to check if activation succeeded
if [ $? -ne 0 ]; then
    echo "Failed to activate virtual environment."
    exit 1
fi

# Install python libraries
echo "Installing python libraries ..."
python -m pip install --upgrade pip  # Upgrade pip to the latest version
pip install -r requirements.txt  # Install the required packages

# Download Elasticsearch 
echo "Downloading Elasticsearch ..."
mkdir -p ./dependencies/  # Use -p to avoid errors if the directory exists
cd ./dependencies/ || exit  # Exit if 'cd' fails

# Download and extract Elasticsearch
curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.15.2-linux-x86_64.tar.gz
tar -xzf elasticsearch-8.15.2-linux-x86_64.tar.gz
mv ./elasticsearch-8.15.2-linux-x86_64 ./elasticsearch

# Download and extract Kibana
echo "Downloading Kibana"
curl -L -O https://artifacts.elastic.co/downloads/kibana/kibana-8.15.2-linux-x86_64.tar.gz
tar -xzf kibana-8.15.2-linux-x86_64.tar.gz
mv ./kibana-8.15.2-linux-x86_64 ./kibana

cd .. || exit  # Exit if 'cd' fails

# Setup run.sh
chmod +x ./run.sh
echo "Setup complete!"
echo "Run run.sh from terminal to activate AutoGen Search"
