#!/bin/bash

# Python HTTP server with live reload for local testing
# Usage: ./test.sh [port]

PORT=${1:-8000}

# Check if livereload is installed, if not install it
if ! python3 -c "import livereload" 2>/dev/null; then
    echo "Installing livereload package..."
    pip3 install livereload
fi

echo "Starting live reload server on http://localhost:$PORT"
echo "Browser will auto-refresh when files change"
echo "Press Ctrl+C to stop the server"

# Open browser after a short delay
(sleep 1 && open "http://localhost:$PORT") &

# Run livereload server
python3 -c "
import livereload
server = livereload.Server()
server.watch('.')
server.serve(port=$PORT, open_url_delay=None)
"
