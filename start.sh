#!/bin/bash
# Campus Connect AI: All-in-one startup script
set -e

PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$PROJECT_DIR"

# Kill any process using Flask (5001) or Streamlit (8505) ports
for port in 5001 8505; do
  pid=$(lsof -ti tcp:$port || true)
  if [ -n "$pid" ]; then
    echo "Port $port is in use by PID $pid. Terminating..."
    kill -9 $pid
  fi
done

# 1. Create and activate Python virtual environment if not exists
if [ ! -d "venv" ]; then
  echo "Creating Python virtual environment..."
  python3 -m venv venv
fi
source venv/bin/activate

# 2. Install backend requirements
if [ -f "backend/requirements.txt" ]; then
  echo "Installing backend requirements..."
  pip install --upgrade pip
  pip install -r backend/requirements.txt
fi

# 3. Ensure frontend dependencies
pip install streamlit requests

# 4. Start Flask backend (check SSL certs)
cd backend
export FLASK_APP=app.py
if [[ -f ssl/cert.pem && -f ssl/key.pem ]]; then
  echo "Starting Flask with SSL..."
  nohup flask run --port=5001 --debug --cert=ssl/cert.pem --key=ssl/key.pem > ../flask.log 2>&1 &
else
  echo "⚠️ SSL cert/key not found. Starting Flask WITHOUT SSL..."
  nohup flask run --port=5001 --debug > ../flask.log 2>&1 &
fi
cd ..

# 5. Start Streamlit chat UI
nohup streamlit run frontend/caichat.py --server.port 8505 > streamlit.log 2>&1 &

echo "✅ Campus Connect AI backend running at: https://localhost:5001"
echo "✅ Streamlit chat UI running at: http://localhost:8505"
echo "📜 Logs: flask.log and streamlit.log"

# Tail logs interactively
tail -n 20 -F flask.log streamlit.log