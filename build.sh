#!/bin/bash
set -e

# Build the Zola site
zola build

# Install dependencies and generate PDF via headless Chrome
npm install
node generate-pdf.mjs

echo "Build complete. PDF generated at public/josh-fairhead-cv.pdf"
