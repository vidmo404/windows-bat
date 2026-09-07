@echo off
setlocal EnableExtensions
title Naprawa proxy i VPN
color 0D
echo Reset proxy i podstaw sieci...
netsh winhttp reset proxy
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f >nul 2>&1
start ms-settings:network-vpn
echo Gotowe.
pause
endlocal
