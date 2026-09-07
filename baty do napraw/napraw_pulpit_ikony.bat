@echo off
setlocal EnableExtensions
title Naprawa pulpitu i ikon
color 0E
echo Odswiezanie pulpitu i ikon...
taskkill /F /IM explorer.exe >nul 2>&1
timeout /t 2 /nobreak >nul
start explorer.exe
start ms-settings:themes
echo Gotowe.
pause
endlocal
