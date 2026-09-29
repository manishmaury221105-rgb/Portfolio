#!/bin/bash
set -e

echo "=== Starting Flutter Web Build for Vercel ==="

# Check if flutter is already installed in environment or cached
if ! command -v flutter &> /dev/null; then
  echo "Flutter not found. Cloning Flutter SDK (stable branch)..."
  if [ ! -d "flutter_sdk" ]; then
    git clone https://github.com/flutter/flutter.git -b stable --depth 1 flutter_sdk
  fi
  export PATH="$PATH:$(pwd)/flutter_sdk/bin"
fi

echo "Checking Flutter version..."
flutter --version

echo "Enabling Flutter Web support..."
flutter config --enable-web --no-analytics

echo "Fetching Flutter dependencies..."
flutter pub get

echo "Compiling Flutter Web release build..."
flutter build web --release

echo "Disabling Flutter Service Worker to guarantee instant live updates across all domains..."
node -e '
const fs = require("fs");
const file = "build/web/flutter_bootstrap.js";
if (fs.existsSync(file)) {
  let content = fs.readFileSync(file, "utf8");
  content = content.replace(/serviceWorkerSettings:\s*\{[\s\S]*?\}/g, "serviceWorkerSettings: null");
  fs.writeFileSync(file, content);
  console.log("Successfully removed service worker registration from flutter_bootstrap.js");
}
'
rm -f build/web/flutter_service_worker.js

echo "=== Flutter Web Build successfully generated in build/web ==="
