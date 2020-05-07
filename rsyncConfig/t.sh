#!/bin/bash
#rsync -av --delete --exclude='*.out' --exclude='*.log' --exclude='*.o' --exclude='*.bin' --exclude='.git/' --progress --files-from=<(cd /run/media/anand/Windows/os-common/repo/coderepo/bitbucket/machine-learning/;find -newermt "2020-04-23 00:00:00" -type f | sed "s/\.\///g" | egrep -v "/.git\/") /run/media/anand/Windows/os-common/repo/coderepo/bitbucket/machine-learning/ /home/anand/ExpanDrive/onedrive/os-common/coderepo/bitbucket/machine-learning/

rsync -av --delete --exclude='*.out' --exclude='*.log' --exclude='*.o' --exclude='*.bin' --exclude='.git/' --progress /run/media/anand/Windows/os-common/repo/coderepo/bitbucket/machine-learning/ /home/anand/ExpanDrive/onedrive/os-common/coderepo/bitbucket/machine-learning/

