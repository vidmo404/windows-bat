@echo off
title Twiksy Windows
color 0E

echo ==========================================
echo      Uruchamianie Chris Titus Tech
echo ==========================================
echo.
echo To otworzy skrypt z internetu w PowerShellu:
echo irm "https://christitus.com/win" ^| iex
echo.
pause

powershell -NoProfile -ExecutionPolicy Bypass -Command "irm 'https://christitus.com/win' | iex"

echo.
echo Gotowe.
pause
