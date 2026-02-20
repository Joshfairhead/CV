#!/bin/bash
set -e

# Build the Zola site
zola build

# Install weasyprint for PDF generation
pip install weasyprint

# Generate PDF from the built CV page
weasyprint public/cv/index.html public/josh-fairhead-cv.pdf

echo "Build complete. PDF generated at public/josh-fairhead-cv.pdf"
