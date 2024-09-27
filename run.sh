#!/bin/bash

# Activate the virtual environment
source ./venv/bin/activate

# Start Elasticsearch in the background
echo "Starting Elasticsearch..."
./dependencies/elasticsearch/bin/elasticsearch &

# Wait for Elasticsearch to be up and running
echo "Waiting for Elasticsearch to start..."
until curl -s http://localhost:9200 | grep -q "You Know, for Search"; do
  sleep 5
done
echo "Elasticsearch is up!"

# Start app.py 
echo "Starting app.py..."
python3 ./src/app.py 2>&1 | tee /tmp/app_output.log &

# Wait for the app to print the assigned port
echo "Waiting for the app to assign a port..."

# Loop until we find the line with "Running on http://127.0.0.1"
PORT=""
while [ -z "$PORT" ]; do
    # Check the log file for the line that contains the port
    PORT=$(grep -oP '(?<=Running on http://127.0.0.1:)\d+' /tmp/app_output.log)
    sleep 2  # Wait a bit before checking again
done

echo "App is running on port $PORT"

# Wait until the port is available
until curl -s http://127.0.0.1:$PORT > /dev/null; do
  sleep 2
done

# Open the web app in the default browser
echo "Opening web browser..."
if command -v xdg-open &> /dev/null; then
    xdg-open http://127.0.0.1:$PORT  # For Linux
elif command -v open &> /dev/null; then
    open http://127.0.0.1:$PORT  # For macOS
elif command -v start &> /dev/null; then
    start http://127.0.0.1:$PORT  # For Windows
else
    echo "No compatible web browser command found."
    exit 1
fi

# Keep the script running if necessary
wait

