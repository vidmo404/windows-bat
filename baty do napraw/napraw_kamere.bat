@echo off
setlocal EnableExtensions
title Naprawa kamery
color 0E

echo ==========================================
echo          Naprawa kamery
echo ==========================================
echo.
echo Ten skrypt:
echo - restartuje ustawienia systemowe
echo - otwiera prywatnosc kamery
echo - otwiera ustawienia Bluetooth i urzadzen
echo.
pause

echo [1/3] Restart panelu ustawien...
taskkill /F /IM SystemSettings.exe >nul 2>&1
timeout /t 2 /nobreak >nul

echo [2/3] Otwieranie prywatnosci kamery...
start ms-settings:privacy-webcam

echo [3/3] Otwieranie ustawien urzadzen...
start ms-settings:camera

echo.
echo Jesli kamera dalej nie dziala:
echo - sprawdz czy aplikacja ma dostep do kamery
echo - odlacz i podlacz kamerke USB
echo - zrestartuj komputer
echo.
pause
endlocal
