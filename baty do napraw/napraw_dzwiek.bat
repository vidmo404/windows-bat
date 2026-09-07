@echo off
setlocal EnableExtensions
title Naprawa dzwieku
color 0E

echo ==========================================
echo           Naprawa dzwieku
echo ==========================================
echo.
echo Ten skrypt:
echo - restartuje uslugi audio
echo - zabija i wznawia procesy audio
echo - otwiera ustawienia dzwieku
echo.
echo Najlepiej uruchomic jako administrator.
echo.
pause

echo [1/4] Restart uslug audio...
net stop Audiosrv >nul 2>&1
net stop AudioEndpointBuilder >nul 2>&1
timeout /t 2 /nobreak >nul
net start AudioEndpointBuilder >nul 2>&1
net start Audiosrv >nul 2>&1

echo [2/4] Restart procesow audio...
taskkill /F /IM sndvol.exe >nul 2>&1
taskkill /F /IM SystemSettings.exe >nul 2>&1

echo [3/4] Otwieranie ustawien dzwieku...
start ms-settings:sound

echo [4/4] Gotowe.
echo.
echo Jesli dalej nie ma dzwieku:
echo - sprawdz domyslne urzadzenie wyjscia
echo - sprawdz czy glosnosc nie jest wyciszona
echo - przepnij sluchawki lub glosniki
echo.
pause
endlocal
