@echo off
setlocal EnableExtensions
title Naprawa menu Start i paska
color 0D

echo ==========================================
echo      Naprawa Start i paska zadan
echo ==========================================
echo.
echo Ten skrypt:
echo - restartuje Explorer
echo - restartuje ShellExperienceHost
echo - restartuje StartMenuExperienceHost
echo.
echo Najlepiej uruchomic jako administrator.
echo.
pause

echo [1/4] Zamykanie procesow powloki...
taskkill /F /IM explorer.exe >nul 2>&1
taskkill /F /IM ShellExperienceHost.exe >nul 2>&1
taskkill /F /IM StartMenuExperienceHost.exe >nul 2>&1

echo [2/4] Krotkie odswiezenie...
timeout /t 3 /nobreak >nul

echo [3/4] Uruchamianie Explorera...
start explorer.exe

echo [4/4] Otwieranie ustawien paska zadan...
start ms-settings:taskbar
echo.
echo Jesli problem wraca:
echo - uruchom napraw_czarny_ekran.bat
echo - uruchom sfc i DISM
echo - zrestartuj komputer
echo.
pause
endlocal
