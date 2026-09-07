@echo off
setlocal EnableExtensions
title Przyspieszanie Windows
color 0A

echo ==========================================
echo     Szybkie odswiezenie i czyszczenie
echo ==========================================
echo.
echo Ten skrypt:
echo - usuwa pliki tymczasowe
echo - czysci cache DNS
echo - resetuje Explorer
echo - zamyka kilka lekkich procesow w tle
echo.
echo Uwaga: nie robi ryzykownych zmian w rejestrze.
echo.
pause

echo [1/6] Zamykanie kilku niepotrzebnych procesow...
for %%P in (OneDrive.exe YourPhone.exe Teams.exe steamwebhelper.exe msedgewebview2.exe) do (
    taskkill /F /IM %%P >nul 2>&1
)

echo [2/6] Czyszczenie folderu TEMP uzytkownika...
if exist "%TEMP%" (
    del /f /s /q "%TEMP%\*" >nul 2>&1
    for /d %%D in ("%TEMP%\*") do rd /s /q "%%~fD" >nul 2>&1
)

echo [3/6] Czyszczenie systemowego TEMP...
if exist "C:\Windows\Temp" (
    del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
    for /d %%D in ("C:\Windows\Temp\*") do rd /s /q "%%~fD" >nul 2>&1
)

echo [4/6] Czyszczenie Prefetch...
if exist "C:\Windows\Prefetch" (
    del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1
)

echo [5/6] Odswiezanie sieci i cache...
ipconfig /flushdns >nul 2>&1

echo [6/6] Restart Explorer...
taskkill /F /IM explorer.exe >nul 2>&1
timeout /t 2 /nobreak >nul
start explorer.exe

echo.
echo ==========================================
echo Gotowe.
echo Jesli chcesz mocniejsze przyspieszenie:
echo - wylacz programy z autostartu
echo - zwolnij miejsce na dysku
echo - sprawdz stan dysku HDD/SSD
echo - zrestartuj komputer po skrypcie
echo ==========================================
echo.
pause
endlocal
