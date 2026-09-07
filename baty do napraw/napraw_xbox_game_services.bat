@echo off
setlocal EnableExtensions
title Naprawa Xbox i Game Services
color 0A
echo Naprawa Xbox App i Game Services...
taskkill /F /IM XboxAppServices.exe >nul 2>&1
taskkill /F /IM GamingServices.exe >nul 2>&1
start ms-settings:appsfeatures
start ms-windows-store://pdp/?productid=9MWPM2CQNLHN
echo Otworzylem panel aplikacji i Microsoft Store dla Game Services.
pause
endlocal
