#!/usr/bin/env bash

# read 
mkdir -p ./roles/"$1"/tasks
mkdir -p ./roles/"$1"/defaults
mkdir -p ./roles/"$1"/vars
mkdir -p ./roles/"$1"/templates
mkdir -p ./roles/"$1"/handlers

touch ./roles/"$1"/tasks/main.yml
touch ./roles/"$1"/defaults/main.yml
touch ./roles/"$1"/vars/main.yml
touch ./roles/"$1"/templates/file.j2
touch ./roles/"$1"/handlers/main.yml
