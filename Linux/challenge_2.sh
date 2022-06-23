#! /bin/bash

echo "The arguments are : ${1} ${2} ${3} ${4} $#"
search_dir=./welcome_101/Linux/ch_folders
cd ch_folders

for i in "${@:2}"
do
  touch "${i}"
done

for entry in "$search_dir"/*
do
  export VAR="$entry"
  export DIR=${VAR%/*}
  if [ -s $entry ] ; then
    original="${VAR##*/}"
    mv "${original%.*}.${original##*.}" "${1}.${original##*.}"
    echo "${1}" >> "${VAR##*/}"
  else
    original="${VAR##*/}"
    mv "${original%.*}.${original##*.}" "E-${1}.${original##*.}"
    echo "${1}" >> "E-${1}.${original##*.}"
  fi
done