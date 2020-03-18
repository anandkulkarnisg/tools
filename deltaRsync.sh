#!/bin/bash
# Author : Anand Kulkarni.
# Synopsis : identify files changes since a given time and sync them across via rsync.
# Invocation : /deltaRsync.sh /home/a1384313/ak-kdb+-projects/kdb+/log4kdb /home/a1384313/rsynctest/log4kdb

a1384313@uklpaumar06a[PRD][~] $ export sinceTimeStamp=$(date +'%Y-%m-%d %H:%M:%S')
a1384313@uklpaumar06a[PRD][~] $ echo $sinceTimeStamp
2020-03-18 03:50:07
a1384313@uklpaumar06a[PRD][~] $ export sinceTimeStamp=$(date +'%Y-%m-%d')
a1384313@uklpaumar06a[PRD][~] $ echo $sinceTimeStamp
2020-03-18
a1384313@uklpaumar06a[PRD][~] $ sinceTimeStamp=$(echo ${sinceTimeStamp}" 00:00:00")
a1384313@uklpaumar06a[PRD][~] $ echo $sinceTimeStamp
2020-03-18 00:00:00
a1384313@uklpaumar06a[PRD][~] $ export execCommand="find /home/a1384313/ak-kdb+-projects/kdb+/log4kdb -newermt \"${sinceTimeStamp}\""
a1384313@uklpaumar06a[PRD][~] $ echo ${execCommand}
find /home/a1384313/ak-kdb+-projects/kdb+/log4kdb -newermt "2020-03-18 00:00:00"
a1384313@uklpaumar06a[PRD][~] $ eval ${execCommand}
/home/a1384313/ak-kdb+-projects/kdb+/log4kdb/sessionfiles
/home/a1384313/ak-kdb+-projects/kdb+/log4kdb/sessionfiles/newsession
/home/a1384313/ak-kdb+-projects/kdb+/log4kdb/sessionfiles/newsession/myses.txt
/home/a1384313/ak-kdb+-projects/kdb+/log4kdb/sessionfiles/anand1.txt
/home/a1384313/ak-kdb+-projects/kdb+/log4kdb/sessionfiles/anand2.txt
a1384313@uklpaumar06a[PRD][~] $

srcFolder=$1
destFolder=$2
deltaListGeneratorCmd="rsync --progress --files-from=<(find ${srcFolder} -mtime -1 -type f | sed \"s/${srcFolder//\//\\/}//g\") ${srcFolder} ${destFolder}"
echo -e "Attempting to execute the command : --> " ${deltaListGeneratorCmd}
eval ${deltaListGeneratorCmd}
exit 0

