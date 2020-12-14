#!/bin/bash -

echo "Generating documentation..."
bundle exec yardoc --output-dir /app/src/yard_docs .

echo "Finding missing documentation..."
bundle exec yard stats . --list-undoc
