#!/bin/bash
# Author : Anand Kulkarni

# synopsis : This helps to switch the symlink pointing to q 32 and 64 bit versions for development purpose. the base root folder is always assumed to be $HOME/coding/
# various q versions are placed here and the symlinks q and q64 point to the currently active versions.

# Perform initial validation.
BASE_FOLDER=$HOME/coding
if [ ! -d $BASE_FOLDER ]; then
    echo -e "BASE_FOLDER is not found. Exiting with error code 1."
    exit 1
fi

# Now we proceed to test variables passed via command line arguments. Validate them.All arguments are mandatory.
if [ $# -ne 2 ]; then
    echo -e "Invalid Usage. Valid Usage is : $0 [version name/number] [l32/l64].Exiting with error code 1."
    exit 1
fi

QVER=$1;QARCH=$2
# First validate the type of q installation. it has to be l32/l64 bit.
if [ "$QARCH" != "l64" -a "$QARCH" != "l32" ]; then
    echo -e "Invalid architecture parameter. It has to be either l32 or l64. Currently it is passed as $QARCH.Exiting with error code 1."
    exit 1
fi
if [ "$QARCH" = "l32" ]; then
    QPREFIX="q";SYMLINK="q"
else
    QPREFIX="q.64.";SYMLINK="q64"
fi

QVERPATH=$BASE_FOLDER/${QPREFIX}${QVER}
# Validate the q folder with mentioned version exists.
if [ ! -d $QVERPATH ]; then
    echo -e "The mentioned version of q folder $QVERPATH does not exist. Exiting the script with failure code of 1."
    exit 1
fi

# All is fine and perfect if we have come to this point. We simply switch the symlink here.
symLinkStatus=$(file $BASE_FOLDER/$SYMLINK|awk -F" " '{print $5}')
if [ "$symLinkStatus" = "$QVERPATH" ]; then
    echo -e "The symlink is already pointing to the correct path = $QVERPATH.Exiting."
else
    rm -f $BASE_FOLDER/$SYMLINK
    cd $BASE_FOLDER
    ln -s $QVERPATH $SYMLINK
    echo "successfully switched $SYMLINK version to $1.Please verify."
fi
exit 0
