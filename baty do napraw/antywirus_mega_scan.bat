@echo off
setlocal EnableExtensions
title Antywirus Mega Scan
color 0A

set "SCRIPT_DIR=%~dp0"
set "LOG_DIR=%SCRIPT_DIR%logi"
if not exist "%LOG_DIR%" mkdir "%LOG_DIR%" >nul 2>&1
set "STAMP=%date:~6,4%-%date:~3,2%-%date:~0,2%_%time:~0,2%-%time:~3,2%"
set "STAMP=%STAMP: =0%"
set "LOG_FILE=%LOG_DIR%\defender_scan_%STAMP%.log"

call :FindDefender
if not exist "%MPCMD%" (
    echo Nie znaleziono MpCmdRun.exe.
    echo Ten skrypt wymaga Windows Defender.
    pause
    exit /b
)

:menu
cls
echo ==========================================
echo         Antywirus Mega Scan
echo ==========================================
echo.
echo Wykryty plik:
echo %MPCMD%
echo.
echo Log bedzie zapisany tutaj:
echo %LOG_FILE%
echo.
echo 1. Aktualizacja baz wirusow
echo 2. Szybki skan
echo 3. Pelny skan
echo 4. Skan niestandardowy folderu
echo 5. Skan sektora rozruchowego
echo 6. Status Defendera i ostatnie zagrozenia
echo 7. Otworz Zabezpieczenia Windows
echo 8. Uruchom pakiet: update + quick + report
echo 9. Powrot
echo.
set /p wybor=Wybierz opcje [1-9]: 

if "%wybor%"=="1" call :UpdateSignatures
if "%wybor%"=="2" call :QuickScan
if "%wybor%"=="3" call :FullScan
if "%wybor%"=="4" call :CustomScan
if "%wybor%"=="5" call :BootScan
if "%wybor%"=="6" call :ReportStatus
if "%wybor%"=="7" start windowsdefender:
if "%wybor%"=="8" call :UpdateSignatures & call :QuickScan & call :ReportStatus
if "%wybor%"=="9" exit /b

if not "%wybor%"=="1" if not "%wybor%"=="2" if not "%wybor%"=="3" if not "%wybor%"=="4" if not "%wybor%"=="5" if not "%wybor%"=="6" if not "%wybor%"=="7" if not "%wybor%"=="8" if not "%wybor%"=="9" (
    echo.
    echo Nieprawidlowy wybor.
    timeout /t 2 /nobreak >nul
)

goto menu

:FindDefender
set "MPCMD="
if exist "C:\Program Files\Windows Defender\MpCmdRun.exe" set "MPCMD=C:\Program Files\Windows Defender\MpCmdRun.exe"
for /f "delims=" %%I in ('powershell -NoProfile -Command "$p=Get-ChildItem ''C:\ProgramData\Microsoft\Windows Defender\Platform'' -Directory -ErrorAction SilentlyContinue ^| Sort-Object Name -Descending ^| Select-Object -First 1 -ExpandProperty FullName; if($p){Join-Path $p ''MpCmdRun.exe''}"') do set "ALT_MPCMD=%%I"
if defined ALT_MPCMD if exist "%ALT_MPCMD%" set "MPCMD=%ALT_MPCMD%"
exit /b

:UpdateSignatures
cls
echo ========================================== >> "%LOG_FILE%"
echo [%date% %time%] Aktualizacja sygnatur >> "%LOG_FILE%"
echo ========================================== >> "%LOG_FILE%"
echo Aktualizacja baz wirusow...
powershell -NoProfile -Command "try { Update-MpSignature | Out-String } catch { $_ | Out-String }" >> "%LOG_FILE%" 2>&1
"%MPCMD%" -SignatureUpdate >> "%LOG_FILE%" 2>&1
echo Gotowe. Szczegoly zapisane w logu.
pause
exit /b

:QuickScan
cls
echo ========================================== >> "%LOG_FILE%"
echo [%date% %time%] Szybki skan >> "%LOG_FILE%"
echo ========================================== >> "%LOG_FILE%"
echo Trwa szybki skan. To moze potrwac chwile...
powershell -NoProfile -Command "Start-MpScan -ScanType QuickScan" >> "%LOG_FILE%" 2>&1
echo Szybki skan zakonczony albo uruchomiony.
pause
exit /b

:FullScan
cls
echo ========================================== >> "%LOG_FILE%"
echo [%date% %time%] Pelny skan >> "%LOG_FILE%"
echo ========================================== >> "%LOG_FILE%"
echo Trwa pelny skan. To moze zajac dlugo...
powershell -NoProfile -Command "Start-MpScan -ScanType FullScan" >> "%LOG_FILE%" 2>&1
echo Pelny skan zakonczony albo uruchomiony.
pause
exit /b

:CustomScan
cls
set "SCAN_PATH="
echo Podaj pelna sciezke do folderu lub dysku.
set /p SCAN_PATH=Sciezka: 
if not defined SCAN_PATH exit /b
if not exist "%SCAN_PATH%" (
    echo Taka sciezka nie istnieje.
    pause
    exit /b
)
echo ========================================== >> "%LOG_FILE%"
echo [%date% %time%] Skan niestandardowy: %SCAN_PATH% >> "%LOG_FILE%"
echo ========================================== >> "%LOG_FILE%"
echo Trwa skan: %SCAN_PATH%
powershell -NoProfile -Command "Start-MpScan -ScanType CustomScan -ScanPath '%SCAN_PATH%'" >> "%LOG_FILE%" 2>&1
echo Skan niestandardowy zakonczony albo uruchomiony.
pause
exit /b

:BootScan
cls
echo ========================================== >> "%LOG_FILE%"
echo [%date% %time%] Skan sektora rozruchowego >> "%LOG_FILE%"
echo ========================================== >> "%LOG_FILE%"
echo Trwa skan sektora rozruchowego...
"%MPCMD%" -Scan -ScanType 2 -BootSectorScan >> "%LOG_FILE%" 2>&1
echo Gotowe.
pause
exit /b

:ReportStatus
cls
echo ========================================== >> "%LOG_FILE%"
echo [%date% %time%] Raport statusu Defendera >> "%LOG_FILE%"
echo ========================================== >> "%LOG_FILE%"
echo Pobieram status Defendera...
powershell -NoProfile -Command ^
 "$s=Get-MpComputerStatus; $t=Get-MpThreatDetection -ErrorAction SilentlyContinue | Select-Object -First 10; 'Status:'; $s | Select-Object AMServiceEnabled,AntispywareEnabled,AntivirusEnabled,BehaviorMonitorEnabled,IoavProtectionEnabled,NISEnabled,RealTimeProtectionEnabled,QuickScanStartTime,QuickScanEndTime,FullScanStartTime,FullScanEndTime,AntivirusSignatureLastUpdated | Format-List; 'Threats:'; if($t){$t | Format-Table -AutoSize} else {'Brak wykrytych wpisow lub historia pusta.'}" >> "%LOG_FILE%" 2>&1
type "%LOG_FILE%" | more
pause
exit /b
