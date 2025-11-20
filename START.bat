@echo off
chcp 65001 >nul
echo ========================================
echo   Система складского учёта
echo ========================================
echo.
echo Проверка установки Node.js...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ОШИБКА] Node.js не установлен!
    echo.
    echo Пожалуйста, установите Node.js с сайта:
    echo https://nodejs.org/
    echo.
    echo После установки перезагрузите компьютер и запустите этот файл снова.
    pause
    exit
)

echo ✓ Node.js установлен
node --version
npm --version
echo.

if not exist "node_modules\" (
    echo Установка зависимостей...
    echo Это займёт несколько минут при первом запуске.
    echo.
    call npm install
    if %errorlevel% neq 0 (
        echo.
        echo [ОШИБКА] Не удалось установить зависимости
        pause
        exit
    )
    echo.
    echo ✓ Зависимости установлены
    echo.
)

echo Запуск приложения...
echo.
echo ========================================
echo   Приложение запущено!
echo ========================================
echo.
echo Откройте браузер и перейдите по адресу:
echo.
echo   http://localhost:5173
echo.
echo Для остановки нажмите Ctrl+C
echo ========================================
echo.

call npm run dev

pause
