#! /bin/bash

echo "The argument is ${1}." # The argument is yunus.

# Script should take only first argument. 
if [ $# -ne 1 ] ; then
	printf 'ERROR! You must provide one and only one argument!\n' >&2
	exit 1
fi

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

<<com
Script has delay condition for delete files.
After 10 seconds created files are deleted.
com
sleep 10
wait
jobs
rm -r ${1}