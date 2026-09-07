@echo off
setlocal EnableExtensions
title Naprawa wysokiego RAM i CPU
color 0C

echo ==========================================
echo      Wysokie zuzycie RAM i CPU
echo ==========================================
echo.
echo Ten skrypt:
echo - zamyka lekkie procesy w tle
echo - czysci pliki tymczasowe
echo - restartuje Explorer
echo - uruchamia szybki raport systemowy
echo.
pause

echo [1/5] Zamykanie popularnych procesow w tle...
for %%P in (OneDrive.exe YourPhone.exe Teams.exe steamwebhelper.exe msedgewebview2.exe Discord.exe) do (
    taskkill /F /IM %%P >nul 2>&1
)

echo [2/5] Czyszczenie TEMP...
if exist "%TEMP%" (
    del /f /s /q "%TEMP%\*" >nul 2>&1
    for /d %%D in ("%TEMP%\*") do rd /s /q "%%~fD" >nul 2>&1
)

echo [3/5] Restart Explorer...
taskkill /F /IM explorer.exe >nul 2>&1
timeout /t 2 /nobreak >nul
start explorer.exe

echo [4/5] Lista procesow z najwyzszym zuzyciem pamieci...
tasklist /FO TABLE /NH | more

echo [5/5] Koniec odswiezania.
echo.
echo ==========================================
echo Jesli problem wraca:
echo - sprawdz autostart
echo - sprawdz antywirusa
echo - sprawdz temperatury CPU i GPU
echo ==========================================
echo.
pause
endlocal
