#!/bin/bash

export BASE_DIR=/home/anand/Downloads/books/concurrency
export LATEST_DIR=$(ls -lrt $BASE_DIR | tail -1 | awk '{print $9}' | sed "s/ //g")
export DIR=${BASE_DIR}/${LATEST_DIR}
echo -e $DIR
