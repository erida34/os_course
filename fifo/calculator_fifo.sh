#!/bin/bash
# Программа для выполнения вычислений 
FIFO_PATH="/tmp/calculator_fifo"

# Создаем именованный канал, если он не существует
if [ ! -p "$FIFO_PATH" ]; then
    mkfifo "$FIFO_PATH"
fi

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
    if read num1 op num2 < "$FIFO_PATH"; then
        result=$(calculate "$num1" "$op" "$num2")
        echo "Результат: $result"
    fi
done