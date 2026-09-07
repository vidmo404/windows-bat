@echo off
setlocal EnableExtensions
title Naprawa Startup folder only
color 0B
echo Otwieranie folderow Startup...
start "" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
start "" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
echo Usun zbedne skroty z autostartu.
pause
endlocal
