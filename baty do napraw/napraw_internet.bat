@echo off
setlocal EnableExtensions
title Naprawa internetu
color 0B

echo ==========================================
echo        Naprawa braku internetu
echo ==========================================
echo.
echo Ten skrypt probuje:
echo - odswiezyc IP i DNS
echo - zresetowac Winsock i TCP/IP
echo - wyczyscic cache DNS
echo.
echo Po wykonaniu najlepiej zrestartowac komputer.
echo.
pause

echo [1/6] Zwolnienie adresu IP...
ipconfig /release

echo [2/6] Odswiezenie adresu IP...
ipconfig /renew

echo [3/6] Czyszczenie DNS...
ipconfig /flushdns

echo [4/6] Reset Winsock...
netsh winsock reset

echo [5/6] Reset TCP/IP...
netsh int ip reset

echo [6/6] Reset ustawien proxy WinHTTP...
netsh winhttp reset proxy

echo.
echo ==========================================
echo Gotowe.
echo Jesli dalej nie ma internetu:
echo - zrestartuj komputer
echo - sprawdz kabel lub Wi-Fi
echo - uruchom router ponownie
echo ==========================================
echo.
pause
endlocal
