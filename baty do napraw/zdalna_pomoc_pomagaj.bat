@echo off
setlocal EnableExtensions
title Zdalna pomoc - pomagaj
color 0A

echo ==========================================
echo       Zdalna pomoc - udziel pomocy
echo ==========================================
echo.
echo Ten skrypt otworzy Quick Assist,
echo gdzie zalogujesz sie i wygenerujesz kod pomocy.
echo.
echo Daj ten kod drugiej osobie,
echo a potem zaakceptuj polaczenie po obu stronach.
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
