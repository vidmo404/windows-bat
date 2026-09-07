@echo off
setlocal EnableExtensions
title Naprawa Defender Mega
color 0C

set "SCRIPT_DIR=%~dp0"
set "LOG_DIR=%SCRIPT_DIR%logi"
if not exist "%LOG_DIR%" mkdir "%LOG_DIR%" >nul 2>&1
set "STAMP=%date:~6,4%-%date:~3,2%-%date:~0,2%_%time:~0,2%-%time:~3,2%"
set "STAMP=%STAMP: =0%"
set "LOG_FILE=%LOG_DIR%\defender_repair_%STAMP%.log"

echo ==========================================
echo         Naprawa Defender Mega
echo ==========================================
echo.
echo Ten skrypt probuje:
echo - sprawdzic status uslug zabezpieczen
echo - uruchomic wazne uslugi
echo - odswiezyc sygnatury
echo - zrobic szybki skan
echo - zapisac raport do logu
echo.
echo Log:
echo %LOG_FILE%
echo.
echo Najlepiej uruchomic jako administrator.
echo.
pause

echo ========================================== >> "%LOG_FILE%"
echo [%date% %time%] Start naprawy Defendera >> "%LOG_FILE%"
echo ========================================== >> "%LOG_FILE%"

echo [1/7] Status uslug zabezpieczen...
sc query WinDefend >> "%LOG_FILE%" 2>&1
sc query WdNisSvc >> "%LOG_FILE%" 2>&1
sc query SecurityHealthService >> "%LOG_FILE%" 2>&1

echo [2/7] Proba uruchomienia uslug...
sc start WinDefend >> "%LOG_FILE%" 2>&1
sc start WdNisSvc >> "%LOG_FILE%" 2>&1
sc start SecurityHealthService >> "%LOG_FILE%" 2>&1

echo [3/7] Raport statusu zabezpieczen...
powershell -NoProfile -Command "Get-MpComputerStatus | Format-List *" >> "%LOG_FILE%" 2>&1

echo [4/7] Aktualizacja sygnatur...
powershell -NoProfile -Command "try { Update-MpSignature | Out-String } catch { $_ | Out-String }" >> "%LOG_FILE%" 2>&1

echo [5/7] Szybki skan...
powershell -NoProfile -Command "try { Start-MpScan -ScanType QuickScan } catch { $_ | Out-String }" >> "%LOG_FILE%" 2>&1

echo [6/7] Historia zagrozen...
powershell -NoProfile -Command "Get-MpThreatDetection -ErrorAction SilentlyContinue | Select-Object -First 20 | Format-Table -AutoSize" >> "%LOG_FILE%" 2>&1

echo [7/7] Otwieranie Zabezpieczen Windows...
start windowsdefender:

echo.
echo Naprawa zakonczona. Raport zapisany tutaj:
echo %LOG_FILE%
echo.
type "%LOG_FILE%" | more
pause
endlocal
