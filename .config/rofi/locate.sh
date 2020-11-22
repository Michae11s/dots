#!/bin/bash
#script for rofi to find files using the locate command since its so much faster

if [ "$@" ]
then
	QUERY=$@
	mkdir -p ~/.cache/rofi
	plocate ~ | grep -v .local | grep -v .share | grep -v .themes | grep -v cache > ~/.cache/rofi/locatecache &
	if [ $(plocate -c $QUERY) == 1 ]; then
		coproc ( xdg-open $QUERY )
		exit 0
	else 
		plocate $QUERY
	fi
else
	echo -en "\0prompt\x1flocate\n"
	echo -en "\0active\x1f0,1\n"
	echo -en "Type your search query to find files in home\0nonselectable\x1ftrue\n"
	echo -en "Return your query to search the entire file system\0nonselectable\x1ftrue\n"
	if [ ! -f ~/.cache/rofi/locatecache ]; then
		mkdir -p ~/.cache/rofi
		plocate ~ | grep -v .local | grep -v .share | grep -v .themes | grep -v cache > ~/.cache/rofi/locatecache
	fi
	cat ~/.cache/rofi/locatecache
fi
