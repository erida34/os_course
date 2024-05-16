#!/bin/bash
#Скрипт, который создает копии самого себя и выводит идентификаторы текущего и родительского процесса

echo "Current PID: $$"
echo "Parent PID: $PPID"

# Создание копии самого себя
cp "$0" "${0}_copy"
echo "Created copy: ${0}_copy"

# Запуск копии
bash "${0}_copy"