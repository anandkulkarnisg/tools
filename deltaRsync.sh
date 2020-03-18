#!/bin/bash
# Author : Anand Kulkarni.
# Synopsis : identify files changes since a given time and sync them across via rsync.
# Invocation : /deltaRsync.sh /home/a1384313/ak-kdb+-projects/kdb+/log4kdb /home/a1384313/rsynctest/log4kdb

srcFolder=$1
destFolder=$2
deltaListGeneratorCmd="rsync --progress --files-from=<(find ${srcFolder} -mtime -1 -type f | sed \"s/${srcFolder//\//\\/}//g\") ${srcFolder} ${destFolder}"
echo -e "Attempting to execute the command : --> " ${deltaListGeneratorCmd}
eval ${deltaListGeneratorCmd}
exit 0

