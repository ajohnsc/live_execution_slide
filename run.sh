#!/bin/bash

WORKDIR=slides
CASE=c
declare -i SLIDE=1

echo "USAGE: press 's' to start in the 1st slide, press 'd' for next slide and press 'a' for previous slide."

function first(){
	SLIDE=1
	wall "`cat $WORKDIR/$SLIDE.sh`"
        bash $WORKDIR/$SLIDE.sh
}

function back() {
	if [ $SLIDE -eq 1 ];then
		wall "`cat $WORKDIR/$SLIDE.sh`"
		bash $WORKDIR/$SLIDE.sh
	else
		SLIDE=$(( $SLIDE - 1 ))
		wall "`cat $WORKDIR/$SLIDE.sh`"
                bash $WORKDIR/$SLIDE.sh
	fi
}

function front() {
	NEXTSLIDE=$(( $SLIDE + 1))
	if [ -f $WORKDIR/$NEXTSLIDE.sh ];then
		wall "`cat $WORKDIR/$NEXTSLIDE.sh`"
		bash $WORKDIR/$NEXTSLIDE.sh
		SLIDE=$NEXTSLIDE
	else
		wall "`cat $WORKDIR/$SLIDE.sh`"
		bash $WORKDIR/$SLIDE.sh
	fi
}


while [ "$CASE" != "q" ]
do
	read -n 1 CASE
	case "$CASE" in
		'a') back;;
		'd') front;;
		's') first;;
	esac	
done
