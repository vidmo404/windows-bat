@echo off
setlocal EnableExtensions
title Naprawa Ethernet
color 0B
echo Naprawa Ethernet...
ipconfig /release
ipconfig /renew
ipconfig /flushdns
netsh int ip reset
start ms-settings:network-ethernet
echo Gotowe.
pause
endlocal
