#!/usr/bin/env bash
set -e

# Make sure that relative paths are reference the correct things.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Set the project name as the name the skeleton-laravel was renamed with git clone
echo "PROJECT_NAME=$(echo ${PWD##*/})" >> ${DIR}/../.env