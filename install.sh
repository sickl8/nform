#!/bin/bash

INSTALL_FOLDER=~/.scripts
if [ $1 ]; then
	INSTALL_FOLDER=$1
	if [[ $1 != /* ]]; then
		INSTALL_FOLDER=$(find "$(pwd)" | awk 'NR==1{print $1}')
	fi
fi
echo installing in $INSTALL_FOLDER ...
mkdir -p $INSTALL_FOLDER
cp nform $INSTALL_FOLDER/
if ! command -v nform &> /dev/null
then
	# echo not found
	if [ -f ~/.zshrc ]; then
		# echo zsh
		echo "export PATH=\"\$PATH\":\"$INSTALL_FOLDER\"" >> ~/.zshrc
		echo installed successfully
	elif [ -f ~/.bashrc ]; then
		# echo bash
		echo "export PATH=\"\$PATH\":\"$INSTALL_FOLDER\"" >> ~/.bashrc
		echo installed successfully
	else
		echo 'no bashrc or zshrc found, install manually'
	fi
else
	true
	# echo found
fi