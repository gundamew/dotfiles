#!/usr/bin/env bash
# Description:
#     Update Homebrew packages automatically.
#
# Usage:
#     bash homebrew_routine.sh
#
# Changelog:
#     2016-06-15 release

echo "[$(date '+%Y-%m-%d %H:%M:%S')] brew update"
/usr/local/bin/brew update

echo "[$(date '+%Y-%m-%d %H:%M:%S')] brew upgrade"
/usr/local/bin/brew upgrade

echo "[$(date '+%Y-%m-%d %H:%M:%S')] brew cleanup"
/usr/local/bin/brew cleanup
