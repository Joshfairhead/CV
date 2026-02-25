#!/bin/bash
set -e

# Build the Zola site
zola build

# Install Chromium system dependencies for Puppeteer on Netlify
apt-get update -qq && apt-get install -yqq \
  libnss3 libatk1.0-0 libatk-bridge2.0-0 libcups2 libxdamage1 \
  libxrandr2 libgbm1 libpango-1.0-0 libcairo2 libasound2 libxshmfence1

# Install dependencies and generate PDF via headless Chrome
npm install
node generate-pdf.mjs

echo "Build complete. PDF generated at public/josh-fairhead-cv.pdf"
