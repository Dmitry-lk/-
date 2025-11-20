#!/bin/bash

echo "========================================"
echo "  Система складского учёта"
echo "========================================"
echo ""

# Проверка Node.js
echo "Проверка установки Node.js..."
if ! command -v node &> /dev/null; then
    echo "[ОШИБКА] Node.js не установлен!"
    echo ""
    echo "Установите Node.js:"
    echo "macOS: brew install node"
    echo "Linux: curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -"
    echo "       sudo apt-get install -y nodejs"
    echo ""
    exit 1
fi

echo "✓ Node.js установлен"
node --version
npm --version
echo ""

# Установка зависимостей
if [ ! -d "node_modules" ]; then
    echo "Установка зависимостей..."
    echo "Это займёт несколько минут при первом запуске."
    echo ""
    npm install
    if [ $? -ne 0 ]; then
        echo ""
        echo "[ОШИБКА] Не удалось установить зависимости"
        exit 1
    fi
    echo ""
    echo "✓ Зависимости установлены"
    echo ""
fi

# Запуск приложения
echo "Запуск приложения..."
echo ""
echo "========================================"
echo "  Приложение запущено!"
echo "========================================"
echo ""
echo "Откройте браузер и перейдите по адресу:"
echo ""
echo "  http://localhost:5173"
echo ""
echo "Для остановки нажмите Ctrl+C"
echo "========================================"
echo ""

npm run dev
