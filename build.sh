#!/bin/bash
set -euo pipefail

echo "=== Starting Flutter Web Production Build for Vercel ==="

# CI environment variables to prevent interactive prompts and background analytics hangs
export CI=true
export FLUTTER_SUPPRESS_ANALYTICS=true
export PUB_ENVIRONMENT=vercel:flutter_web

# Install Flutter SDK if not already in PATH or cached
if ! command -v flutter &> /dev/null; then
  echo "Flutter CLI not detected. Fetching Flutter SDK (stable channel)..."
  if [ ! -d "flutter_sdk" ]; then
    git clone --depth 1 -b stable --single-branch https://github.com/flutter/flutter.git flutter_sdk
  fi
  export PATH="$(pwd)/flutter_sdk/bin:$PATH"
fi

echo "Configuring Flutter for headless Web build..."
flutter config --no-analytics --enable-web

echo "Pre-caching Web engine artifacts..."
flutter precache --web

echo "Resolving dependencies..."
flutter pub get

echo "Compiling optimized Flutter Web release build..."
flutter build web --release --no-wasm-dry-run

echo "Removing Service Worker registration to guarantee instant updates across all domains..."
node -e '
const fs = require("fs");
const file = "build/web/flutter_bootstrap.js";
if (fs.existsSync(file)) {
  let content = fs.readFileSync(file, "utf8");
  content = content.replace(/serviceWorkerSettings:\s*\{[\s\S]*?\}/g, "serviceWorkerSettings: null");
  fs.writeFileSync(file, content);
  console.log("Service Worker registration successfully removed from flutter_bootstrap.js");
}
'
rm -f build/web/flutter_service_worker.js

echo "=== Flutter Web Production Build successfully generated in build/web ==="
