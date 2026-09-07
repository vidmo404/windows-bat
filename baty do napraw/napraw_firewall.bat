@echo off
setlocal EnableExtensions
title Naprawa firewalla
color 0C
echo Naprawa Windows Firewall...
net stop mpssvc >nul 2>&1
timeout /t 2 /nobreak >nul
net start mpssvc >nul 2>&1
netsh advfirewall reset
start windowsdefender:
echo Gotowe.
pause
endlocal
