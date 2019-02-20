#!/bin/bash

currDir=$(pwd)
cd $HOME

hiddenFolderDirList=$(ls -ap | egrep "^\..*/$"| tr "/" " ")
targetFolderDir=$HOME/localrepo/fedora/anand-home-hidden

for hiddenFolder in $(echo $hiddenFolderDirList | tr " " "\n")
do
  if [ "$hiddenFolder" != "." -a "$hiddenFolder" != ".." ]; then
    echo -e "Processing the hidden folder = $hiddenFolder."
    read -p "Press any key to continue..." -n1 -s
    cp -vR $hiddenFolder $targetFolderDir
    rm -rf $HOME/$hiddenFolder
    runSymLinkCmd="ln -s $targetFolderDir/$hiddenFolder $HOME/$hiddenFolder"
    echo -e "I am running the symlink cmd below."
    echo -e $runSymLinkCmd
    eval $runSymLinkCmd
    echo -e "done processing the item = $hiddenFolder"
  fi
done

cd $currDir
exit 0

