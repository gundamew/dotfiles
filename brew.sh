#!/usr/bin/env bash
set -euo pipefail

brew install ack

brew install bash bash-completion

brew install git
ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight
