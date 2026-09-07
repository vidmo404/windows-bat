@echo off
setlocal EnableExtensions
title Naprawa czarnego ekranu
color 0E

echo ==========================================
echo   Naprawa: czarny ekran i tylko myszka
echo ==========================================
echo.
echo Ten skrypt probuje:
echo - uruchomic ponownie Explorer
echo - przywrocic poprawna powloke systemu
echo - sprawdzic pliki Windows
echo - naprawic obraz systemu DISM
echo.
echo Najlepiej uruchomic jako administrator.
echo.
pause

echo [1/7] Zamykanie i ponowne uruchamianie Explorer...
taskkill /F /IM explorer.exe >nul 2>&1
timeout /t 2 /nobreak >nul
start explorer.exe

echo [2/7] Sprawdzanie klucza Shell...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d explorer.exe /f >nul 2>&1

echo [3/7] Restart waznych procesow sesji...
taskkill /F /IM StartMenuExperienceHost.exe >nul 2>&1
taskkill /F /IM ShellExperienceHost.exe >nul 2>&1
taskkill /F /IM SearchHost.exe >nul 2>&1
timeout /t 2 /nobreak >nul
start explorer.exe

echo [4/7] Kontrola plikow systemowych SFC...
sfc /scannow

echo [5/7] Naprawa obrazu systemu DISM...
DISM /Online /Cleanup-Image /RestoreHealth

echo [6/7] Sprawdzenie dysku po restarcie...
echo Y|chkdsk C: /f

echo [7/7] Koniec procedury.
echo.
echo ==========================================
echo Jesli pulpit nadal nie wrocil:
echo - nacisnij Ctrl+Shift+Esc
echo - Plik > Uruchom nowe zadanie
echo - wpisz explorer.exe
echo - jesli dalej nic, zrestartuj komputer
echo ==========================================
echo.
pause
endlocal
