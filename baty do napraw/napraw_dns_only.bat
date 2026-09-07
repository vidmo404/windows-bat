@echo off
setlocal EnableExtensions
title Naprawa DNS only
color 0A
echo Czyszczenie DNS...
ipconfig /flushdns
ipconfig /registerdns
start ms-settings:network-status
echo Gotowe.
pause
endlocal
