#!/bin/bash
# Author : Anand Kulkarni.
# Synopsis : identify files changes since a given time and sync them across via rsync.
# Invocation : /deltaRsync.sh /home/anand/ak-kdb+-projects/kdb+/log4kdb /home/anand/rsynctest/log4kdb

anand@mydevhost[PRD][~] $ export sinceTimeStamp=$(date +'%Y-%m-%d')
anand@mydevhost[PRD][~] $ sinceTimeStamp=$(echo ${sinceTimeStamp}" 00:00:00")
anand@mydevhost[PRD][~] $ export execCommand="find /home/anand/ak-kdb+-projects/kdb+/log4kdb -newermt \"${sinceTimeStamp}\""
anand@mydevhost[PRD][~] $ eval ${execCommand}
/home/anand/ak-kdb+-projects/kdb+/log4kdb/sessionfiles
/home/anand/ak-kdb+-projects/kdb+/log4kdb/sessionfiles/newsession
/home/anand/ak-kdb+-projects/kdb+/log4kdb/sessionfiles/newsession/myses.txt
/home/anand/ak-kdb+-projects/kdb+/log4kdb/sessionfiles/anand1.txt
/home/anand/ak-kdb+-projects/kdb+/log4kdb/sessionfiles/anand2.txt
anand@mydevhost[PRD][~] $

https://serverfault.com/questions/538767/how-to-rsync-files-folders-from-a-specific-date-forward/642231
https://unix.stackexchange.com/questions/424319/how-to-find-files-based-on-timestamp
https://unix.stackexchange.com/questions/45926/display-time-stamp-in-dd-mm-yyyy-hhmmssms-in-unix-or-linux

#!/bin/bash

srcFolder=$1
destFolder=$2
export lastTimeStampSynced=$(cat lastSyncTimeStamp.conf)
deltaListGeneratorCmd="rsync --progress --files-from=<(find ${srcFolder} -newermt \"${sinceTimeStamp}\" -type f | sed \"s/${srcFolder//\//\\/}//g\") ${srcFolder} ${destFolder}"
echo -e "Attempting to execute the command : --> " ${deltaListGeneratorCmd}
eval ${deltaListGeneratorCmd}
exit 0
