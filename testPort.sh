#!/bin/bash

function isPortInUse()
{
    portUseStatus=$(netstat -aon | grep "$1" | grep -i "tcp" | wc -l)
    if [ $portUseStatus -ge 1 ]; then
        echo "Yes"
    else
        echo "No"
    fi
}

portStatus=$(isPortInUse $1)
echo -e "Port Status is = " $portStatus
