#!/bin/sh

mkdir ~/test                                                    #  1. Создать директорию test в домашней директории пользователя
ls -la ~ >> ~/test/list                                         #  2. Создать в ней файл list, содержащий список всех файлов и поддиректорий домашней директории (включая скрытые) в таком виде, что можно однозначно определить какая из записей является именем файла, а какая названием директории
mkdir ~/test/links                                              #  3. Создать в директории test директорию links
ln ~/test/list ~/test/links/list_link                           #  4. Создать в директории links жёсткую ссылку на файл list с именем list_link
rm ~/test/list -f                                               #  5. Удалить файл ~/test/list
cat ~/test/links/list_link                                      #  6. Вывести на экран содержимое файла list_link
ln ~/test/links/list_link ~/list1                               #  7. Создать в домашней директории пользователя жёсткую ссылку на файл list_link с именем list1
find /etc/* -type f -name *.conf >> ~/list_conf                 #  8. Создать в домашней директории файл list_conf, содержащий список файлов с раширением .conf, из директории /etc и всех её поддиректорий
find /etc/* -type d -name *.d >> ~/list_d                       #  9. Создать в домашней директории файл list_d, содержащий список всех поддиректорий директории /etc с расширением .d
cat ~/list_conf ~/list_d >> ~/list_conf_d                       # 10. Создать файл list_conf_d, включив в него последовательно содержимое list_conf и list_f
ln -s ~/list_conf_d ~/test/links/list_conf_d_link               # 11. Создать в директории links символьную ссылку на файл list_conf_d с именем list_conf_d_link
ln ~/list1 ~/test/links/links_list1                             # 12. Создать в директории links жёсткую ссылку на файл list1 с именем links_list1
less ~/test/links/list_conf_d_link                              # 13. Вывести на экран содержимое файла list_conf_d_link с возможностью постраничного просмотра содержимого
mkdir ~/test/.sub                                               # 14. Создать в директории test скрытую поддиректорию sub
cp ~/list_conf_d ~/test/.sub/                                   # 15. Скопировать в неё файл list_conf_d
cp -b ~/list_conf_d ~/test/.sub/                                # 16. Ещё раз скопировать туда же этот файл в режиме автоматического создания резеврной копии замещаемых файлов
mv ~/test/.sub/list_conf_d ~/test/.sub/list_etc                 # 17. Переименовать скопированный файл list_conf_d в list_etc
rm ~/list_conf_d                                                # 18. Удалить исходный файл list_conf_d
less ~/test/links/list_conf_d_link                              # 19. Попытаться вывести на экран файл list_conf_d_link
cal 2012 >> ~/test/calendar.txt                                 # 20. Создать в директории test файл calendar.txt, в который вывести календарь за 2012 год
head ~/test/calendar.txt                                        # 21. Используя одну команду вывести только три первых месяца из получившегося файла
ls -R -la ~/test/                                               # 22. Вывести на экран полный список файлов (включая все поддиректории) директории test
ls -l ~/test/links/list_link                                    # 23. Получить число имён (жёстких ссылок) файла list_link
man man >> ~/man.txt                                            # 24. Создать в домашней директории файл man.txt, содержащий документацию на команду man
split -b 1k ~/man.txt                                           # 25. Разбить файл man.txt на несколько файлов, каждый из которых будет иметь размер не более 1 килобайта
mkdir ~/man.dir                                                 # 26. Создать директорию man.dir
mv ~/xa* ~/man.dir/                                             # 27. Переместить одной командой все файлы, полученные в пункте 25, в директорию man.dir
cat ~/man.dir/* > ~/man.dir/man.txt                             # 28. Собрать файлы в директории man.dir обратно в файл с именем man.txt
cmp ~/man.txt ~/man.dir/man.txt && echo "OK" || echo "ERROR"    # 29. Сравнить файлы man.txt в домашней директории и в директории man.dir и вывести сообщение "OK", если файлы идентичны

# 30. Добавить в файл man.txt, находящийся в домашней директории, несколько строчек с произвольными символами в начало файла и несколько строчек в конце файла
echo -e 'String 1\nString 2' | cat - ~/man.txt > temp && mv temp ~/man.txt && echo -e 'String 3\nString4' >> ~/man.txt

# 30. Добавить в файл man.txt, находящийся в домашней директории, несколько строчек с произвольными символами в начало файла и несколько строчек в конце файла
echo -e 'String 1\nString 2' | cat - ~/man.txt > temp && mv temp ~/man.txt && echo -e 'String 3\nString4' >> ~/man.txt

diff ~/man.txt ~/man.dir/man.txt >> ~/changes.diff              # 31. Одной командой получить разницу между файлами в отдельный файл в стандартном формате для наложения патчей
mv ~/changes.diff ~/man.dir/changes.diff                        # 32. Переместить файл с разницей в директорию man.dir
patch ~/man.dir/man.txt -i ~/man.dir/changes.diff -R            # 33. Наложить патч из файла с разницей на man.txt в директории man.dir
cmp ~/man.txt ~/man.dir/man.txt && echo "OK" || echo "ERROR"    # 34. Сравнить файлы man.txt в домашней директории и в директории man.dir и вывести сообщение "OK", если файлы идентичны

# 35. Сделать паузу для проверки работы
echo "Pleas check. The results. Then press Enter to continue"
read

# 36. Уничтожить следы своей деятельности — стереть все файлы и директории, которые были созданы в рамках работы скрипта
rm ~/list1 ~/list_conf ~/list_d ~/man.txt && rm -r ~/man.dir/ ~/test/
