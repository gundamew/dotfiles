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
  declare -a php_lint_result
  for file in $(svn_modified_files_php); do
    php_lint_error=`php -l $file 2>&1 | grep -i 'parse error'`

    if [ -n "$php_lint_error" ]; then
      php_lint_result+=("$php_lint_error")
    fi
  done

  if [ ${#php_lint_result[@]} -gt 0 ]; then
    for ((i = 0; i < ${#php_lint_result[@]}; i++)); do
      echo "${php_lint_result[$i]}"
    done
  else
    echo "No syntax errors detected"
  fi
}

function svn_crlf_checker() {
  declare -a crlf_check_result
  for file in $(svn_modified_files); do
    crlf_amount=`grep -P '\r\n$' $file | wc -l`

    if [ $crlf_amount -gt 0 ]; then
      crlf_check_result+=("$file: $crlf_amount")
    fi
  done

  if [ ${#crlf_check_result[@]} -gt 0 ]; then
    for ((i = 0; i < ${#crlf_check_result[@]}; i++)); do
      echo "${crlf_check_result[$i]}"
    done
  else
    echo "No CRLF detected"
  fi
}

echo "> PHP syntax error:"
svn_php_lint
echo -ne "\n"
echo "> CRLF detected:"
svn_crlf_checker
