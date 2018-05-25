#!/usr/bin/env bash

# Get the path of the directory in which the script is loacted.
SOURCE=${BASH_SOURCE[0]}

# Resolve $SOURCE until the file is no longer a symlink.
while [[ -h $SOURCE ]]; do
	DIR=$(cd -P $(dirname $SOURCE) && pwd)
	SOURCE=$(readlink $SOURCE)
	# If $SOURCE was a relative symlink we need to resolve it relative to
	# the path where the symlink file was located.
	[[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE
done

DIR=$(cd -P $(dirname $SOURCE) && pwd)

for i in $(ls $DIR/dot); do
	echo Linking $DIR/dot/$i to $HOME/.$i
	ln -sf $DIR/dot/$i "$HOME/.$i"
done