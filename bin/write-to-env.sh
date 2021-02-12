#!/usr/bin/env bash
set -e

KEY=${1}
VALUE=${2}

# Make sure that relative paths are reference the correct things.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Set the project name as the name the skeleton-laravel was renamed with git clone
filename=${DIR}/../.env
key=${KEY}
value=${VALUE}

if ! grep -R "^[#]*\s*${key}=.*" $filename > /dev/null; then
  echo "APPENDING because '${key}' not found"
  echo "$key=$value" >> $filename
else
  echo "SETTING because '${key}' found already"
  sed -ir "s/^[#]*\s*${key}=.*/$key=$value/" $filename
fi