@echo off
setlocal EnableExtensions
title SFC i DISM
color 0B
echo Uruchamianie SFC...
sfc /scannow
echo Uruchamianie DISM...
DISM /Online /Cleanup-Image /RestoreHealth
echo Gotowe.
pause
endlocal
