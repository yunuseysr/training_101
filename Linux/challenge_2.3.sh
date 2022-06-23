#! /bin/bash

echo "There are $# arguments."
echo "The arguments are : ${1} ${2} ${3} ${4}"
search_dir=./training_101/Linux/ch_folders
cd ch_folders

echo "--------------------------------"
echo "New files added"
echo "--------------------------------"
for i in "${@:2}"
do
  touch "${i}"
done

echo "--------------------------------"
echo "Files' contents"
echo "--------------------------------"
for entry in "$search_dir"/*
do
  echo "$entry"
  cat "$entry"
done
tree

echo "--------------------------------"
echo "Files' upgrade with arguments"
echo "--------------------------------"
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

echo "--------------------------------"
echo "Files' contents"
echo "--------------------------------"
for entry in "$search_dir"/*
do
    cat "$entry"
done
tree

echo "--------------------------------"
echo "Python debuging file"
echo "--------------------------------"

for entry in "$search_dir"/*
do
  export VAR="$entry"
  original="${VAR##*/}"
  if [ "py" == ${original##*.} ] ; then
    cd ..
    echo "Python Output:"
    python hello_world.py "${original%.*}" "${1}"
    cd ch_folders
  fi
  done
tree
