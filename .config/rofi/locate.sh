#!/bin/bash
#script for rofi to find files using the locate command since its so much faster

if [ "$@" ]
then
	QUERY=$@
	if [ $(plocate -c $QUERY) == 1 ]; then
		coproc ( xdg-open $QUERY )
		exit 0
	else 
		plocate $QUERY
	fi
else
	echo -en "\0active\x1f0,1\n"
	echo -en "Type your search query to find files in home\0nonselectable\x1ftrue\n"
	echo -en "Return your query to search the entire file system\0nonselectable\x1ftrue\n"
	plocate ~
fi
