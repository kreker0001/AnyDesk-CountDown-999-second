@echo off
:: 
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Запустите этот скрипт от имени администратора.
    pause
    exit /b
)

TASKKILL.exe /F /IM AnyDesk.exe /T >NUL 2>&1

set "configPath=%AppData%\AnyDesk\user.conf"
set "folderPath1=%AppData%\AnyDesk"
set "folderPath2=C:\ProgramData\AnyDesk"

set "tempFile=%folderPath1%\temp.conf"

if exist "%configPath%" (
    findstr "^ad\.roster\.items" "%configPath%" > "%tempFile%"
    
    move /Y "%tempFile%" "%configPath%"
)

for /D %%d in ("%folderPath1%\*") do (
    if /I not "%%~nxd"=="user.conf" rd /S /Q "%%d"
)
for %%f in ("%folderPath1%\*") do (
    if /I not "%%~nxf"=="user.conf" del /F /Q "%%f"
)

for /D %%d in ("%folderPath2%\*") do (
    if /I not "%%~nxd"=="user.conf" rd /S /Q "%%d"
)
for %%f in ("%folderPath2%\*") do (
    if /I not "%%~nxf"=="user.conf" del /F /Q "%%f"
)

echo Очистка завершена | by kreker0001
pause
exit /b
