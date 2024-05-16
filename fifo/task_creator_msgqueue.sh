#!/bin/bash
# Программа для формирования задач
QUEUE_NAME="/calculator_queue"

# Очистка очереди сообщений, если она существует
if [ -e "$QUEUE_NAME" ]; then
    rm "$QUEUE_NAME"
fi

# Создание очереди сообщений
mkfifo "$QUEUE_NAME"

# Функция для отправки задачи в очередь сообщений
send_task() {
    echo "$1 $2 $3" > "$QUEUE_NAME"
}

while true; do
    echo "Введите операцию в формате: число1 операция число2 (например, 3 + 4):"
    read num1 op num2
    send_task "$num1" "$op" "$num2"
done
