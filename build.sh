#!/bin/bash
set -e

echo "=== Preparing Digital Manish Static Website ==="

# Create build/web directory for Vercel
mkdir -p build/web

# Copy all static assets and files into build/web
cp -r assets build/web/
cp -r css build/web/
cp -r js build/web/
cp -r icons build/web/
cp *.html build/web/
cp favicon.png build/web/
cp manifest.json build/web/
cp robots.txt build/web/
cp sitemap.xml build/web/
[ -f sw.js ] && cp sw.js build/web/
[ -f flutter_service_worker.js ] && cp flutter_service_worker.js build/web/

echo "=== Static Build successfully generated in build/web ==="
