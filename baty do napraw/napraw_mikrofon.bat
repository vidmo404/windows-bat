@echo off
setlocal EnableExtensions
title Naprawa mikrofonu
color 0C

echo ==========================================
echo         Naprawa mikrofonu
echo ==========================================
echo.
echo Ten skrypt:
echo - restartuje uslugi audio
echo - otwiera prywatnosc mikrofonu
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

echo [2/4] Restart ustawien...
taskkill /F /IM SystemSettings.exe >nul 2>&1

echo [3/4] Otwieranie prywatnosci mikrofonu...
start ms-settings:privacy-microphone

echo [4/4] Otwieranie ustawien dzwieku...
start ms-settings:sound
echo.
pause
endlocal
