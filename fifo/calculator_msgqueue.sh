#!/bin/bash
# Программа для выполнения вычислений
QUEUE_NAME="/calculator_queue"

# Очистка очереди сообщений, если она существует
if [ -e "$QUEUE_NAME" ]; then
    rm "$QUEUE_NAME"
fi

# Создание очереди сообщений
mkfifo "$QUEUE_NAME"

# Функция для выполнения вычисления
calculate() {
    case $2 in
        '+') echo "$(($1 + $3))" ;;
        '-') echo "$(($1 - $3))" ;;
        '*') echo "$(($1 * $3))" ;;
        '/') echo "$(($1 / $3))" ;;
        *) echo "Неизвестная операция: $2" ;;
    esac
}

while true; do
    if read num1 op num2 < "$QUEUE_NAME"; then
        result=$(calculate "$num1" "$op" "$num2")
        echo "Результат: $result"
    fi
done
