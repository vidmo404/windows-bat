@echo off
setlocal EnableExtensions
:menu
cls
title Pomocnik Windows
color 0B

echo ==========================================
echo            Pomocnik Windows
echo ==========================================
echo.
echo 1. Przyspiesz i odswiez komputer
echo 2. Napraw czarny ekran i myszke
echo 3. Napraw brak internetu
echo 4. Napraw wysokie zuzycie RAM/CPU
echo 5. Napraw Windows Update
echo 6. Wylacz smieci z autostartu
echo 7. Napraw dzwiek
echo 8. Napraw Bluetooth
echo 9. Napraw drukarke
echo 10. Napraw Microsoft Store
echo 11. Napraw kamere
echo 12. Napraw mikrofon
echo 13. Napraw USB
echo 14. Napraw Start i pasek zadan
echo 15. Antywirus Mega Scan
echo 16. Napraw Defender Mega
echo 17. Extra narzedzia x20
echo 18. Wyjscie
echo.
set /p wybor=Wybierz opcje [1-18]: 

if "%wybor%"=="1" call "%~dp0przyspiesz_komp.bat"
if "%wybor%"=="2" call "%~dp0napraw_czarny_ekran.bat"
if "%wybor%"=="3" call "%~dp0napraw_internet.bat"
if "%wybor%"=="4" call "%~dp0napraw_ram_cpu.bat"
if "%wybor%"=="5" call "%~dp0napraw_windows_update.bat"
if "%wybor%"=="6" call "%~dp0wylacz_syf_z_autostartu.bat"
if "%wybor%"=="7" call "%~dp0napraw_dzwiek.bat"
if "%wybor%"=="8" call "%~dp0napraw_bluetooth.bat"
if "%wybor%"=="9" call "%~dp0napraw_drukarke.bat"
if "%wybor%"=="10" call "%~dp0napraw_microsoft_store.bat"
if "%wybor%"=="11" call "%~dp0napraw_kamere.bat"
if "%wybor%"=="12" call "%~dp0napraw_mikrofon.bat"
if "%wybor%"=="13" call "%~dp0napraw_usb.bat"
if "%wybor%"=="14" call "%~dp0napraw_start_i_pasek.bat"
if "%wybor%"=="15" call "%~dp0antywirus_mega_scan.bat"
if "%wybor%"=="16" call "%~dp0napraw_defender_mega.bat"
if "%wybor%"=="17" call "%~dp0extra_narzedzia_menu.bat"
if "%wybor%"=="18" exit /b

if not "%wybor%"=="1" if not "%wybor%"=="2" if not "%wybor%"=="3" if not "%wybor%"=="4" if not "%wybor%"=="5" if not "%wybor%"=="6" if not "%wybor%"=="7" if not "%wybor%"=="8" if not "%wybor%"=="9" if not "%wybor%"=="10" if not "%wybor%"=="11" if not "%wybor%"=="12" if not "%wybor%"=="13" if not "%wybor%"=="14" if not "%wybor%"=="15" if not "%wybor%"=="16" if not "%wybor%"=="17" if not "%wybor%"=="18" (
    echo.
    echo Nieprawidlowy wybor.
    timeout /t 2 /nobreak >nul
)

goto menu
