#!/usr/bin/env bash
# Description:
#   Do some checks before commit:
#   1. Check if there were syntax errors in modified PHP files under svn control.
#   2. Check if there were CRLF in modified files under svn control.
#
# Usage:
#   bash svn_pre_commit.sh
#
# Changelog:
#   2014-10-03 release
#   2014-10-15 Add function svn_crlf_checker(); Rename script to svn_pre_commit.sh

source ${GIT_LOCAL}/dotfiles/bash/functions_svn

function svn_php_lint() {
  svn_modified_files_php | while read file; do
    php_lint_result=`php -l $file 2>&1 | grep -i 'parse error'`
    if [ -z $php_lint_result ]; then
      echo "No syntax errors detected"
    fi
  done
}

function svn_crlf_checker() {
  svn_modified_files | while read file; do
    crlf_amount=`grep -P '\r\n$' $file | wc -l`
    if [ $crlf_amount -gt 0 ]; then
      echo "$file: $crlf_amount"
    else
      echo "No CRLF detected"
    fi
  done
}

echo "> PHP syntax error:"
svn_php_lint
echo -ne "\n"
echo "> CRLF:"
svn_crlf_checker
