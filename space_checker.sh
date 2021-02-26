# Создать файл crontab, который ежедневно регистрирует занятое 
# каждым пользователем дисковое пространство в его домашней директории.
# текст скрипта по адресу: /home/krotbrod/sandbox/script.sh

#!/bin/bash

# сначала скрипт узнаёт дату, затем размер всех домашних папок в кб 
# некоторые файлы в поддиректориях недоступны для скрипта, потому что недостаточно 
# прав, сообщение об этом также выводится в лог 
# но если запускать скрипт из /etc/crontab от пользователя root, то всё будет 
# работать без ошибок

day=$(date)
size=$(du -s /home/* 2>&1)
echo -e "$day\n$size\n\n\n" 

$ crontab -e
SHELL = /bin/sh
MAILTO = krotkolobrod@gmail.com
PATH = /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:/home/krotbrod/sandbox
28 15 * * * $HOME/sandbox/script.sh >> $HOME/sandbox/sizelog.txt
