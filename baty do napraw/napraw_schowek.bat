@echo off
setlocal EnableExtensions
title Naprawa schowka
color 0A
echo Reset schowka...
echo off | clip
taskkill /F /IM rdpclip.exe >nul 2>&1
start rdpclip.exe
start ms-settings:clipboard
echo Gotowe.
pause
endlocal
