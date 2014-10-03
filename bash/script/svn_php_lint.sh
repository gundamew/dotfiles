#!/usr/bin/env bash
# Description:
#   Check if there were syntax errors in modified PHP files under svn control.
#
# Usage:
#   bash php_lint.sh
#
# Changelog:
#   2014-10-03 release

source ${GIT_LOCAL}/dotfiles/bash/functions_svn

function get_modified_php_files() {
  svn_modified_files_php $(svn_real_working_path) | awk '{ print $2 }'
}

get_modified_php_files | while read file; do
  php -l $file 2>&1 | grep -i 'parse error'
done
