#!/bin/bash

# script aim at: update current directory svn repo because svn hostname changed
# eg: old svn info: http:11.11.11.11/svn/repo
#     new svn info: httP:22.22.22.22/svn/repo


NAME=xxx
PASSWD=xxx
CURPATH=$(dirname $0)
dir=$(ls .)

for item in $dir
do
	if [ -d $item ];then
		cd $item
		url=`svn info|grep "^URL"|cut -d ' ' -f 2`
		if [ ${#url} -gt 0 ];then
			oldurl=$url
			match=${url:19}   #19 depends on your own svn url
			newurl='http://xxxxx'$match
			svn sw --relocate $url $newurl --username $NAME --password $PASSWD
		fi
		cd $CURPATH
	fi
	
done
