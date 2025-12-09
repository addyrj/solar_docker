#!/bin/sh
set -e

echo "⏳ Waiting for MySQL to be ready..."

# Wait for MySQL to accept connections (TCP check)
while ! nc -z mysql 3306; do
  echo "Waiting for MySQL to be available on port 3306..."
  sleep 2
done

echo "✅ MySQL port is open. Giving it extra time to fully initialize..."
sleep 15

echo "🚀 Starting Node.js server (will retry DB connection internally)..."
exec node index.js