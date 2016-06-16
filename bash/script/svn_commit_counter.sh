#!/usr/bin/env bash
# Description:
#   Count SVN trunk commit times per day for each developer.
#
# Usage:
#   bash svn_commit_counter.sh[ int $start_date[ int $end_date]]
#
# Example:
#   bash svn_commit_counter.sh
#   bash svn_commit_counter.sh 20140429
#   bash svn_commit_counter.sh 20140429 20140728
#
# Changelog:
#   2014-02-25 release
#   2014-07-17 Let user can input the date arguments; Check and reformat date argument

function reformat_date_string() {
  case $2 in
    short)
      echo `date -d $1 +%Y%m%d`
      ;;
    yesterday)
      echo `date -d "$1 -1 day" +%Y-%m-%d`
      ;;
    *)
      echo `date -d $1 +%Y-%m-%d`
      ;;
  esac
}

today=`date +%Y-%m-%d`

if [ -z $1 ]; then
  end_date=$(reformat_date_string $today)
  start_date=$(reformat_date_string $today 'yesterday')
elif [ -z $2 ]; then
  end_date=$(reformat_date_string $1)
  start_date=$(reformat_date_string $end_date 'yesterday')
else
  end_date=$(reformat_date_string $2)
  start_date=$(reformat_date_string $1)
fi

if [ $(reformat_date_string $start_date 'short') -gt $(reformat_date_string $end_date 'short') ]; then
  echo 'Error: End date must greater than start date.'
  exit
fi

echo 'SVN commit times rank ('$start_date' to '$end_date'):'
svn log $SVN_REMOTE_RTG -v --xml -r {$start_date}:{$end_date} | grep -o '<author.*/author>' | sort | uniq -c | sort -rn | sed 's/<\/*author>//g'
