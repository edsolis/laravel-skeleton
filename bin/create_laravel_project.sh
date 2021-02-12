#!/bin/bash

#!/usr/bin/env bash
set -e

NC=$(tput sgr0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)


# Output a generic usage statement and exit.
function usage {
    cat <<EOF

Usage:
    ./create_laravel_project.sh [-h] [-d [project directory]]

  Options:
  -d             Project directory
  -h             Output this help message and exit.

EOF

    exit 0
}


Remove all parameters only use the first one to set the project name
while [ $# -gt 0 ]
do
  case $1 in
    -*) break;;
    *) eval "arg_$n=\$1"; PROJECT_NAME=${1} ;;
  esac
  shift
done

while getopts "d:h:" opt
do
   case "$opt" in
      d ) PROJECT_DIR="$OPTARG" ;;
      h ) usage ;;
      ? ) usage ;; # Print usage function in case parameter is non-existent
	  *) # preserve unmatched args
   esac
done

if [[ "${PROJECT_NAME}" == "" ]]; then
    echo "${GREEN}Usage:${NC}"
    echo "${BLUE}    ${0} <project name>${NC}"
    echo
    echo "${GREEN}Example: For a Laravel proejct name <blog> use:${NC}"
    echo "${BLUE}    ${0} blog${NC}"
    exit 1

# Make sure that relative paths are reference the correct things.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"



# Set to the current dir in case is not specidifed
if [ -z "${PROJECT_DIR}" ]
then
   PROJECT_DIR=${DIR}
fi

# Validates if directory is valid
if [ ! -d "${PROJECT_DIR}" ]
then
	echo
	echo "${RED}Directory [${PROJECT_DIR}] not valid${NC}"
	echo
	exit 1
fi

git clone https://github.com/edsolis/laravel-skeleton.git ${PROJECT_DIR}]/${PROJECT_NAME}

echo
echo "${MAGENTA}Project [${PROJECT_NAME}] will be created at [${PROJECT_DIR}]${NC}"
echo

IMAGE=composer

docker run --rm --interactive --tty \
           -v ${PROJECT_DIR}:/app -w /app\
           ${IMAGE} \
           create-project --prefer-dist laravel/laravel:^8.0 src

echo
echo "${MAGENTA}Project successfully [${PROJECT_NAME}] created at [${PROJECT_DIR}/${PROJECT_NAME}${NC}]"
echo
