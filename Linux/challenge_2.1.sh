#! /bin/bash

echo "There are $# arguments."
echo "The arguments are : ${1} ${2} ${3} ${4}"
search_dir=./welcome_101/Linux/ch_folders
cd ch_folders

for i in "${@:2}"
do
  touch "${i}"
done

for entry in "$search_dir"/*
do
  export VAR="$entry" # file name
  export DIR=${VAR%/*} # file directory
  if [ -s $entry ] ; then
    original="${VAR##*/}"
    mv "${original%.*}.${original##*.}" "${1}.${original##*.}"  # preserves the extensions of created files
    echo "${1}" >> "${VAR##*/}" # writes first argument into files 
  else
    original="${VAR##*/}"
    mv "${original%.*}.${original##*.}" "E-${1}.${original##*.}" # preserves the extensions of created files
    echo "${1}" >> "E-${1}.${original##*.}" # writes first argument into files 
  fi
done