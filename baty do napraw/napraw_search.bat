@echo off
setlocal EnableExtensions
title Naprawa Search
color 0B
echo Naprawa Windows Search...
taskkill /F /IM SearchHost.exe >nul 2>&1
taskkill /F /IM SearchIndexer.exe >nul 2>&1
net stop WSearch >nul 2>&1
timeout /t 2 /nobreak >nul
net start WSearch >nul 2>&1
start ms-settings:cortana
echo Gotowe.
pause
endlocal
