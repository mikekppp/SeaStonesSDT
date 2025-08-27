#!/bin/zsh


# Exit immediately if a command exits with a non-zero status
set -e
# Trap errors and report the line number and command that failed
trap 'echo "❌ Error on line $LINENO: $BASH_COMMAND"; exit 1' ERR

# Assume this script is running in the MacOS subdirectory of the Git repository, so
# cd up a level to where the Makefile is in the root directory
cd ..

echo "\n🧹 Running make clean..."
if ! make clean; then
  echo "\n❌ make clean failed."
  exit 1
fi
