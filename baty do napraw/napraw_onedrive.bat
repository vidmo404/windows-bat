@echo off
setlocal EnableExtensions
title Naprawa OneDrive
color 09
echo Reset OneDrive...
taskkill /F /IM OneDrive.exe >nul 2>&1
if exist "%LocalAppData%\Microsoft\OneDrive\OneDrive.exe" "%LocalAppData%\Microsoft\OneDrive\OneDrive.exe" /reset
timeout /t 5 /nobreak >nul
if exist "%LocalAppData%\Microsoft\OneDrive\OneDrive.exe" start "" "%LocalAppData%\Microsoft\OneDrive\OneDrive.exe"
echo Gotowe.
pause
endlocal
