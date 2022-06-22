#! /bin/bash

echo "The argument is ${1}." # The argument is yunus.

<<com
Creates a folder which folder name is the argument.
After that It  creates a new file (.txt) which same name with folder.
com
mkdir ${1} 
cd ${1}
touch ${1}.txt
cat ${1}.txt
echo "${1}" > ${1}.txt
cd ..