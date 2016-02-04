#!/bin/bash
#===============================================================================
#
#          FILE:  AddTitle.sh
# 
#         USAGE:  ./AddTitle.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:   (), 
#       COMPANY:  
#       VERSION:  1.0
#       CREATED:  02/04/2016 08:55:48 AM CST
#      REVISION:  ---
#===============================================================================

files="*.md"
regex1="(.*)\.md"
regex2="title"
# regex2="((?!title).)*"
for f in $files
do
  if [[ $f =~ $regex1 ]]; then
    filename_no_ext="${BASH_REMATCH[1]}"
    filename="${BASH_REMATCH[1]}.md"
    firstline=`head -n 1 $filename`
    if [[ $firstline =~ $regex2 ]]; then
      :
    else
      echo "${filename}"
      sed -i "1s/^/title: $filename_no_ext\ndate: 2016-01-06 19:00:24\ntags: \n---\n/" $f
    fi
  fi
done
