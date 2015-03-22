#!/bin/sh

# Отдельный второй скрипт, который полностью уничтожает плоды деятельности предыдущего:

# Удаляет созданных пользователей
userdel u1
userdel u2

# И их домашние каталоги
rm /home/u1 -r -f
rm /home/u2 -r -f

# Удаляет созданные группы
groupdel g1
groupdel test13group

# Удаляет все созданные в предыдущем скрипте файлы и каталоги
rm work5.log
rm /etc/skel/readme.txt
rm /home/test13 -r -f
rm /home/test15 -r -f
