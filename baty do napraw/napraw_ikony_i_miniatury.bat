@echo off
setlocal EnableExtensions
title Naprawa ikon i miniaturek
color 0E
echo Naprawa cache ikon i miniaturek...
taskkill /F /IM explorer.exe >nul 2>&1
del /f /q "%LocalAppData%\IconCache.db" >nul 2>&1
del /f /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*" >nul 2>&1
timeout /t 2 /nobreak >nul
start explorer.exe
echo Gotowe.
pause
endlocal
