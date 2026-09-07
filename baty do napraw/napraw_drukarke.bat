@echo off
setlocal EnableExtensions
title Naprawa drukarki
color 0B

echo ==========================================
echo         Naprawa drukarki
echo ==========================================
echo.
echo Ten skrypt:
echo - restartuje bufor wydruku
echo - czysci kolejke drukowania
echo - otwiera ustawienia drukarek
echo.
echo Najlepiej uruchomic jako administrator.
echo.
pause

echo [1/4] Zatrzymywanie bufora wydruku...
net stop spooler >nul 2>&1

echo [2/4] Czyszczenie kolejki...
del /f /q "C:\Windows\System32\spool\PRINTERS\*" >nul 2>&1

echo [3/4] Uruchamianie bufora wydruku...
net start spooler >nul 2>&1

echo [4/4] Otwieranie ustawien drukarek...
start ms-settings:printers
echo.
echo Gotowe.
pause
endlocal
