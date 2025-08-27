#!/bin/zsh


# Exit immediately if a command exits with a non-zero status
set -e
# Trap errors and report the line number and command that failed
trap 'echo "❌ Error on line $LINENO: $BASH_COMMAND"; exit 1' ERR

# Reminder to run mac_install.sh before proceeding
echo "\n⚠️ Please ensure you've run mac_install.sh and it has completed all steps successfully before continuing."


echo "\n🚀 Building pihpsdr"

# Assume this script is running in the MacOS subdirectory of the Git repository, so
# cd up a level to where the Makefile is in the root directory
cd ..

echo "\n🧹 Running make clean..."
if ! make clean; then
  echo "\n❌ make clean failed."
  exit 1
fi

echo "\n🏗️ Building application with make app..."
# if ! make app CC="zig cc" CXX="zig c++"; then
if ! make app; then
  echo "\n❌ make app failed."
  exit 1
fi

if [[ -d "/Applications/pihpsdr.app" ]]; then
  echo "\n⚠️ pihpsdr.app already exists in /Applications. Do you want to replace it? (y/n): "
  read CONFIRM_DELETE
  if [[ "$CONFIRM_DELETE" != "y" ]]; then
    echo "🚫 Exiting without overwriting existing application."
    exit 0
  fi
  echo "\n🗑️ Removing existing pihpsdr.app from /Applications..."
  if ! rm -rf /Applications/pihpsdr.app; then
    echo "\n❌ Failed to remove existing pihpsdr.app from /Applications."
    exit 1
  fi
fi
echo "\n📦 Moving pihpsdr.app to /Applications..."
if ! mv pihpsdr.app /Applications; then
  echo "\n❌ Failed to move pihpsdr.app to /Applications."
  exit 1
fi
