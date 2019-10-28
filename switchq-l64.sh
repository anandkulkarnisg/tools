#!/bin/bash
# switch the q version to appropriate one 64 bit version.

version_name=$1
foldername=$(echo q.64.$version_name)

if [ ! -d $HOME/coding/$foldername ] ; then
	echo "Folder not found.Exiting with Failure."
	exit 1
else
	rm -f q64
	ln -s $foldername q64
	echo "Successfully switched q64 version to $1.Please verify"
fi

exit 0 
