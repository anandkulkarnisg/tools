#!/bin/bash
# switch the q version to appropriate one.

version_name=$1
foldername=$(echo q$version_name)

if [ ! -d $HOME/coding/$foldername ] ; then
	echo "Folder not found.Exiting with Failure."
	exit 1
else
	rm -f q
	ln -s $foldername q
	echo "Successfully switched q version to $1.Please verify"
fi

exit 0
