@echo off
setlocal EnableExtensions
title Naprawa Microsoft Store
color 0D

echo ==========================================
echo      Naprawa Microsoft Store
echo ==========================================
echo.
echo Ten skrypt:
echo - resetuje cache Store
echo - restartuje Store i ustawienia
echo - otwiera panel aplikacji
echo.
pause

echo [1/4] Zamykanie Store...
taskkill /F /IM WinStore.App.exe >nul 2>&1
taskkill /F /IM SystemSettings.exe >nul 2>&1

echo [2/4] Reset cache Store...
wsreset.exe

echo [3/4] Otwieranie ustawien aplikacji...
start ms-settings:appsfeatures

echo [4/4] Gotowe.
echo.
echo Jesli Store dalej nie dziala:
echo - zaloguj sie ponownie do konta Microsoft
echo - uruchom Windows Update
echo - zrestartuj komputer
echo.
pause
endlocal
