#!/bin/bash

function getUrlListByKey(){
configFilePath=$HOME/bitbucket/fedoracustomsettings/chrome-group-sessions-dict.cfg
cfgFile=$(cat $configFilePath|grep $1|awk -F"|" '{print $2}')
echo $cfgFile
}

urlList=$(getUrlListByKey $1)
chromeBin="/usr/bin/google-chrome-stable"
command="nohup $chromeBin -new-window"
export logFolder="/var/log/chrome-session"
export logFile="chrome-session-live.log"
for urlItem in $urlList
do
  command=$(echo $command $urlItem)
done
command=$(echo $command" &")
echo $(date) " : The command is :->" $command >> ${logFolder}/${logFile}
eval $command
exit 0
