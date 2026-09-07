@echo off
setlocal EnableExtensions
title Naprawa Bluetooth
color 09

echo ==========================================
echo         Naprawa Bluetooth
echo ==========================================
echo.
echo Ten skrypt:
echo - restartuje uslugi Bluetooth
echo - otwiera ustawienia Bluetooth
echo - odswieza panel urzadzen
echo.
echo Najlepiej uruchomic jako administrator.
echo.
pause

echo [1/4] Restart uslug Bluetooth...
net stop bthserv >nul 2>&1
timeout /t 2 /nobreak >nul
net start bthserv >nul 2>&1

echo [2/4] Odswiezenie ustawien...
taskkill /F /IM SystemSettings.exe >nul 2>&1

echo [3/4] Otwieranie ustawien Bluetooth...
start ms-settings:bluetooth

echo [4/4] Gotowe.
echo.
echo Jesli urzadzenie dalej nie dziala:
echo - usun je z listy i sparuj ponownie
echo - sprawdz czy Bluetooth jest wlaczony
echo - zrestartuj komputer
echo.
pause
endlocal
