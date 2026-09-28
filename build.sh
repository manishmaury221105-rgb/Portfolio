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

echo "=== Flutter Web Build successfully generated in build/web ==="
