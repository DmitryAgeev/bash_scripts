#!/bin/bash

# Написать скрипт, который удаляет из текстового файла пустые строки и 
# заменяет маленькие символы на большие (воспользуйтесь tr или sed).

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'

echo "Enter the filename:"
read filename

if [ -f $filename ]; then
  tr "[:lower:]" "[:upper:]" < $filename > tempfile
  tr -s '\n' < tempfile > $filename
  rm -f tempfile
  echo -en "${YELLOW}========\033[0m\n"
  cat $filename
  echo -en "${YELLOW}========\033[0m\n\n"
  echo -en "${GREEN}DONE\033[0m\n\n"
else
  echo -en "${RED}File doesn't exist\033[0m\n"
fi
