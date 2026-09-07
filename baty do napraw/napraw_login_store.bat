@echo off
setlocal EnableExtensions
title Naprawa logowania Store
color 0D
echo Reset Store i logowania...
taskkill /F /IM WinStore.App.exe >nul 2>&1
wsreset.exe
start ms-settings:emailandaccounts
start ms-settings:appsfeatures
echo Gotowe.
pause
endlocal
