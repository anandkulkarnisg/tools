#!/bin/bash

if [ "$#" -ne "1" ]; then
  echo -e "Usage : $0 [directory to serve ]."
  exit 1
else
  if [ ! -d $1 ]; then
    echo -e "The mentioned directory is not found.Please verify..."
    exit 1
  fi
fi

export cwd=$PWD
cd $1
export localIpAddr=$(ifconfig wlp2s0|grep "inet "|awk '{print $2}')
export port="8099"
echo -e "Running the http local server at http://${localIpAddr}:${port} using python http.server module at $port..."
python -m http.server $port
cd $cwd
echo -e "Exiting from the http service wrapper script with success!."
exit 0
