# Создать скрипт мониторинга лога, чтобы он выводил сообщения при попытке 
# неудачной аутентификации пользователя /var/log/auth.log, отслеживая сообщения 
# примерно такого вида:
# May 16 19:45:52 vlamp login[102782]: FAILED LOGIN (1) on '/dev/tty3' FOR 'user', 
# Authentication failure
# Проверить скрипт, выполнив ошибочную регистрацию с виртуального терминала.
#!/bin/bash

RED='\033[0;31m'

tail -n 0 -F /var/log/auth.log | \
while read LINE
do
  echo "$LINE" | grep -q "failure"
  if [ $? = 0 ]
  then
    echo "\n"
    echo -en "${RED}Attention! Authentication failure!\033[0m\n"
  fi
done
