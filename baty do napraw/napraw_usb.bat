@echo off
setlocal EnableExtensions
title Naprawa USB
color 0A

echo ==========================================
echo            Naprawa USB
echo ==========================================
echo.
echo Ten skrypt:
echo - restartuje Explorer
echo - odswieza panel urzadzen
echo - otwiera Menedzer urzadzen
echo.
pause

echo [1/3] Restart Explorer...
taskkill /F /IM explorer.exe >nul 2>&1
timeout /t 2 /nobreak >nul
start explorer.exe

echo [2/3] Otwieranie Menedzera urzadzen...
start devmgmt.msc

echo [3/3] Gotowe.
echo.
echo Jesli USB dalej nie dziala:
echo - przepnij urzadzenie do innego portu
echo - odlacz inne urzadzenia USB
echo - zrestartuj komputer
echo.
pause
endlocal
