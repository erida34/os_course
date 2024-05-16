#!/bin/bash

# Изначальная строка для вывода
current_message="Initial message"
echo "Current PID: $$"
# Обработчик сигнала SIGUSR1
handle_sigusr1() {
    current_message="Received SIGUSR1"
}

# Обработчик сигнала SIGUSR2
handle_sigusr2() {
    current_message="Received SIGUSR2"
}

# Устанавливаем обработчики сигналов
trap 'handle_sigusr1' SIGUSR1
trap 'handle_sigusr2' SIGUSR2

# Бесконечный цикл, выводящий текущую строку
while true; do
    echo "$current_message"
    sleep 1
done