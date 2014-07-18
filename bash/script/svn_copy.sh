#!/usr/bin/env bash
# Description:
#   Simplify the flow of creating new branch by one script.
#
# Usage:
#   bash svn_copy.sh (then follow the prompts)
#
# Changelog:
#   2012-10-26 release
#   2013-12-12 Change read statement to select statement, and encapsulated some code to functions
#   2014-07-17 Use bash environment variable

function set_branch_name() {
  read -p "Enter new branch name: " branch_name_postfix
  branch_name_prefix=${USER}_${TODAY_SHORT}_
  branch_name=${branch_name_prefix}${branch_name_postfix}
  echo $branch_name
}

function create_remote_branch() {
  remote_branch_path=${SVN_REMOTE_DEV}/$1
  read -p "First comment of new branch: " copy_msg
  svn copy $2 $remote_branch_path -m "$copy_msg" -q
  echo $remote_branch_path
}

function checkout_branch() {
  svn co $1 ${SVN_LOCAL}/$2
}

select copy_from in rtg qa custom; do
  case $copy_from in
    rtg)
      copy_from=$SVN_REMOTE_RTG
      ;;
    qa)
      copy_from=$SVN_REMOTE_QA
      ;;
    custom)
      read -p "Enter the branch name to copy from: " branch_copy_from
      copy_from=${SVN_REMOTE_DEV}/${branch_copy_from}
      ;;
    *)
      exit
      ;;
  esac
  branch_name=$(set_branch_name)
  remote_branch_path=$(create_remote_branch $branch_name $copy_from)
  checkout_branch $remote_branch_path $branch_name
  exit
done
