#!/usr/bin/env bash

# Exit immediately if any command fails
set -e

# Check if 'act' command exists in PATH
if ! command -v act >/dev/null 2>&1; then
  echo "ERROR: 'act' is not installed. Please install it first."
  exit 1
fi

echo "✅ 'act' is installed: $(act --version)"

# Check if .github/workflows directory exists
if [ ! -d ".github/workflows" ]; then
  echo "ERROR: .github/workflows directory not found."
  exit 1
fi

# Run 'act' in dry-run mode to check for syntax errors
echo "👉 Running 'act'..."

if act; then
  echo "✅ 'act' executed successfully."
else
  echo "❌ 'act' execution failed."
  exit 1
fi

echo "🎉 All checks passed!"
