@echo off
setlocal EnableExtensions
title Zdalna pomoc - odbierz
color 0B

echo ==========================================
echo       Zdalna pomoc - odbierz pomoc
echo ==========================================
echo.
echo Ten skrypt otworzy Quick Assist w Windows,
echo aby druga osoba mogla Ci pomoc po wpisaniu kodu.
echo.
echo Uwaga: to jest jawne narzedzie Microsoft,
echo nic nie dziala ukrycie.
echo.
pause

start ms-quick-assist:

echo.
echo Jesli aplikacja sie nie otworzy:
echo - nacisnij Start
echo - wpisz Quick Assist albo Szybka pomoc
echo - uruchom aplikacje recznie
echo.
pause
endlocal
