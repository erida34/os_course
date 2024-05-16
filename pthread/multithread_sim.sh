#!/bin/bash

# Проверка наличия одного аргумента (количество потоков)
if [ $# -ne 1 ]; then
    echo "Usage: $0 <number_of_threads>"
    exit 1
fi

# Количество потоков
num_threads=$1

# Функция для выполнения задачи потока
thread_task() {
    thread_id=$1
    for ((i=1; i<=10; i++)); do
        echo "Привет, я процесс №$thread_id"
        sleep 1
    done
}

# Запуск потоков
for ((i=1; i<=num_threads; i++)); do
    thread_task $i &
done

# Ожидание завершения всех фоновых процессов
wait

echo "Все потоки завершены."
