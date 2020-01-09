#!/bin/bash
# Author : Anand Kulkarni
# Author : date : Change Description.
# Anand : 08012020 : Initial script to get git repository names from website directly for a given user.

# Setup config variables.
baseUrl="https://github.com"
userId="anandkulkarnisg"
tempFile="/tmp/repo.list.txt"

wget -qO ${tempFile} ${baseUrl}/${userId}/?tab=repositories
cat ${tempFile}|grep "name codeRepository"|awk -F"/" '{print $3}'|awk '{print $1}'|sed "s/\"//g"
rm -f ${tempFile}
