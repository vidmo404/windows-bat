@echo off
setlocal EnableExtensions
title Naprawa Wi-Fi
color 09
echo Naprawa Wi-Fi...
net stop WlanSvc >nul 2>&1
timeout /t 2 /nobreak >nul
net start WlanSvc >nul 2>&1
ipconfig /flushdns
netsh winsock reset
start ms-settings:network-wifi
echo Zrestartuj komputer, jesli problem wraca.
pause
endlocal
