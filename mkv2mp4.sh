#!/bin/bash

export srcFile=$1
export destFile=${srcFile%mkv}mp4
cmd="ffmpeg -i $srcFile -codec copy $destFile"
echo -e "command is : $cmd"
eval $cmd
