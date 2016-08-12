#!/bin/bash

usage() {
  echo $1' [editorconfig|eslint|jshint]'
}

download() {
  URL=https://raw.githubusercontent.com/jonatasleon/node-style-guide/master/$1
  echo $URL
  curl -O $URL
}

file=""

while [[ "$1" != "" ]]; do
  case $1 in
    editorconfig | jshintrc | eslintrc ) file=.$1
                                         ;;
    * )  usage $0
         exit 1
  esac
  shift
done

if [[ "$file" = "" ]]; then
  exit 1
else
  echo $file
  download $file
  exit 0
fi
