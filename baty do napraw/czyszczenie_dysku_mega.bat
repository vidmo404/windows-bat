@echo off
setlocal EnableExtensions
title Czyszczenie dysku Mega
color 0A
echo Czyszczenie plikow tymczasowych i kosza...
cleanmgr /sagerun:1
del /f /s /q "%TEMP%\*" >nul 2>&1
PowerShell -NoProfile -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue"
echo Gotowe.
pause
endlocal
