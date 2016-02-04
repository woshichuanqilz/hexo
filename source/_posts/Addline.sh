#!/bin/bash
files="*"
regex1="(.*)\.md"
regex2="title"
for f in $files
do
  if [[ $f =~ $regex1 ]]; then
      sed -i "10s/^/<!--more-->\n/" $f
  fi
done
