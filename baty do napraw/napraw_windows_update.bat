@echo off
setlocal EnableExtensions
title Naprawa Windows Update
color 0D

echo ==========================================
echo        Naprawa Windows Update
echo ==========================================
echo.
echo Ten skrypt:
echo - zatrzymuje uslugi aktualizacji
echo - czysci cache SoftwareDistribution i Catroot2
echo - uruchamia SFC i DISM
echo - uruchamia uslugi ponownie
echo.
echo Najlepiej uruchomic jako administrator.
echo.
pause

echo [1/6] Zatrzymywanie uslug...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
net stop cryptsvc >nul 2>&1
net stop msiserver >nul 2>&1

echo [2/6] Czyszczenie cache Windows Update...
if exist "C:\Windows\SoftwareDistribution" ren "C:\Windows\SoftwareDistribution" SoftwareDistribution.old >nul 2>&1
if exist "C:\Windows\System32\catroot2" ren "C:\Windows\System32\catroot2" catroot2.old >nul 2>&1

echo [3/6] Naprawa plikow systemowych SFC...
sfc /scannow

echo [4/6] Naprawa obrazu systemu DISM...
DISM /Online /Cleanup-Image /RestoreHealth

echo [5/6] Uruchamianie uslug ponownie...
net start cryptsvc >nul 2>&1
net start bits >nul 2>&1
net start wuauserv >nul 2>&1
net start msiserver >nul 2>&1

echo [6/6] Czyszczenie zakonczone.
echo.
echo ==========================================
echo Gotowe.
echo Po tym zrestartuj komputer i sprawdz aktualizacje.
echo ==========================================
echo.
pause
endlocal
