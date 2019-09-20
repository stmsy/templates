#!/bin/sh

PROJECT=$1
NAME=$2
EMAIL=$3
GITIGNORE='http://www.gitignore.io/api/python'
UTILS='https://github.com/stmsy/utils.git'

if [ $# -ne 3 ]; then
    echo "3 params are required"
else
    if [ ! -e $PROJECT ]; then
        echo "creating ${PROJECT}..."
	mkdir -p $PROJECT/{notebooks,data}
	cd $PROJECT
	curl $GITIGNORE > .gitignore
	git init
	git config --local user.name $NAME
	git config --local user.name $EMAIL
	git submodule add $UTILS notebooks/utils
    else
	echo "${PROJECT} already exists"
    fi
fi
