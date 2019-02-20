#!/bin/bash

currDir=$(pwd)
cd $HOME

hiddenFileList=$(ls -ap | grep -v / | egrep "^\." | xargs ls -lrt | grep -v ^l | awk '{print $9}')
export targetFolder=$HOME/localrepo/fedora/anand-home-hidden

for hiddenFile in $hiddenFileList
do
  echo -e "Processing the item = $hiddenFile."
  cp -vR $HOME/$hiddenFile $targetFolder
  rm -f $HOME/$hiddenFile
  ln -s $targetFolder/$hiddenFile $HOME/$hiddenFile
  echo -e "Done processing the item = $hiddenFile."
  read -p "Press any key to continue..." -n1 -s
done

cd $currDir
exit 0

