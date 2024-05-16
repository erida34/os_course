#!/bin/bash
# Программа для формирования задач
FIFO_PATH="/tmp/calculator_fifo"

# Создаем именованный канал, если он не существует
if [ ! -p "$FIFO_PATH" ]; then
    mkfifo "$FIFO_PATH"
fi

# Функция для отправки задачи в канал
send_task() {
    echo "$1 $2 $3" > "$FIFO_PATH"
}

while true; do
    echo "Введите операцию в формате: число1 операция число2 (например, 3 + 4):"
    read num1 op num2
    send_task "$num1" "$op" "$num2"
done