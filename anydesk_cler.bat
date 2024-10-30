@echo off
:: 
echo [debug] Проверяю запущен ли скрипт от имени администратора
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Запустите этот скрипт от имени администратора.
    pause
    exit /b
)

set "configPath=%AppData%\AnyDesk\user.conf"
set "folderPath1=%AppData%\AnyDesk"
set "folderPath2=C:\ProgramData\AnyDesk"

echo [debug] Создаю временный файл для хранения переменной ad.roster.items
set "tempFile=%folderPath1%\temp.conf"

echo [debug] Проверяю существует ли файл user.conf
if exist "%configPath%" (
    echo [debug] Нахожу строчку с переменной ad.roster.items и записываем их во временный файл
    findstr "^ad\.roster\.items" "%configPath%" > "%tempFile%"
    
    echo [debug] Перезаписываю user.conf только с переменной ad.roster.items
    move /Y "%tempFile%" "%configPath%"
)

echo [debug] Удаляю все файлы и папки в папке %AppData%\AnyDesk, кроме user.conf
for /D %%d in ("%folderPath1%\*") do (
    if /I not "%%~nxd"=="user.conf" rd /S /Q "%%d"
)
for %%f in ("%folderPath1%\*") do (
    if /I not "%%~nxf"=="user.conf" del /F /Q "%%f"
)

echo [debug] Удаляю все файлы и папки в папке C:\ProgramData\AnyDesk, кроме user.conf
for /D %%d in ("%folderPath2%\*") do (
    if /I not "%%~nxd"=="user.conf" rd /S /Q "%%d"
)
for %%f in ("%folderPath2%\*") do (
    if /I not "%%~nxf"=="user.conf" del /F /Q "%%f"
)

echo Очистка завершена | By kreker0001.
pause
exit /b
