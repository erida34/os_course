#!/bin/bash
#Скрипт с созданием нового процесса с помощью exec

echo "Original script"
echo "Current PID: $$"
echo "Parent PID: $PPID"

# Создание нового скрипта, который будет запущен через exec
cat << 'EOF' > new_script.sh
#!/bin/bash
echo "New script with exec"
echo "Current PID: $$"
echo "Parent PID: $PPID"
EOF

chmod +x new_script.sh

# Используем exec для запуска нового процесса
exec ./new_script.sh