#!/bin/bash
# 1. Написать скрипт, который удаляет из текстового файла пустые строки и заменяет маленькие символы на большие. Воспользуйтесь tr или SED.
# Скрипт принимает 2 аргумента: 1 - исходный файл, 2 - итоговый файл.

file=$1
new_file=$2

if [ -e $file ]
        then
                sed -e '/^$/d' -e 's/ //g' -e 's/\(.*\)/\U\1/' $file > $new_file
                echo "done"
        else
                echo "file not found"
fi

exit 0
