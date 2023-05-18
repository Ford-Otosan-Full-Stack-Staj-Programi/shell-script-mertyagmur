#!/bin/bash

# Check if the correct number of arguments is provided
if [ $# -eq 1 ] 
then
  echo "No directory given, using the working directory"
  keyword="$1"
  directory=$(pwd)
elif [ $# -eq 0 ] || [ $# -gt 2 ]
then
  echo "Usage: $0 <keyword> <directory>"
  exit 1
else
  keyword="$1"
  directory="$2"
fi

# Check if the given directory exists
if [ ! -d "$directory" ] 
then
  echo "Directory '$directory' does not exist."
  echo "If you want to use a relative path, don't forget to use '.'"
  exit 1
fi

# Search for files that contain the given keyword
if grep -r -l "$keyword" "$directory"
then
  true
else
  echo "The given keyword doesn't exist in the given directory"
fi