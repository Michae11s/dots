#!/bin/bash
#script for rofi to find files using the locate command since its so much faster

if [ ! -z "$@" ]
then
	QUERY=$@
	echo $QUERY
else
	echo "-- Type your search query to find files"
fi
