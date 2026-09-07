@echo off
setlocal EnableExtensions
title Naprawa planu zasilania
color 0A
echo Reset planow zasilania...
powercfg -restoredefaultschemes
powercfg /setactive SCHEME_BALANCED
start ms-settings:powersleep
echo Gotowe.
pause
endlocal
