@echo off
setlocal EnableExtensions
title Naprawa czasu i daty
color 0E
echo Synchronizacja czasu...
net stop w32time >nul 2>&1
net start w32time >nul 2>&1
w32tm /resync >nul 2>&1
start ms-settings:dateandtime
echo Gotowe.
pause
endlocal
