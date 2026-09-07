@echo off
setlocal EnableExtensions
title Naprawa Explorer Mega
color 0D
echo Restart powloki Windows...
taskkill /F /IM explorer.exe >nul 2>&1
taskkill /F /IM ShellExperienceHost.exe >nul 2>&1
taskkill /F /IM StartMenuExperienceHost.exe >nul 2>&1
timeout /t 3 /nobreak >nul
start explorer.exe
echo Gotowe.
pause
endlocal
