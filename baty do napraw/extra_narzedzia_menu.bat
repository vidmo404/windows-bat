@echo off
setlocal EnableExtensions
:menu
cls
title Extra Narzedzia Windows
color 0A

echo ==========================================
echo         Extra Narzedzia Windows
echo ==========================================
echo.
echo 1. Napraw Search
echo 2. Napraw ikony i miniatury
echo 3. Napraw schowek
echo 4. Napraw Wi-Fi
echo 5. Napraw Ethernet
echo 6. Napraw proxy i VPN
echo 7. Napraw firewall
echo 8. Napraw czas i date
echo 9. Napraw plan zasilania
echo 10. SFC i DISM
echo 11. Czyszczenie dysku i kosza
echo 12. Napraw Explorer Mega
echo 13. Napraw OneDrive
echo 14. Napraw Xbox i Game Services
echo 15. Napraw skojarzenia EXE
echo 16. Napraw pulpit i ikony
echo 17. Napraw druk PDF i XPS
echo 18. Napraw konto Microsoft Store login
echo 19. Napraw siec DNS only
echo 20. Napraw startup folder only
echo 21. Wyjscie
echo.
set /p wybor=Wybierz opcje [1-21]: 

if "%wybor%"=="1" call "%~dp0napraw_search.bat"
if "%wybor%"=="2" call "%~dp0napraw_ikony_i_miniatury.bat"
if "%wybor%"=="3" call "%~dp0napraw_schowek.bat"
if "%wybor%"=="4" call "%~dp0napraw_wifi.bat"
if "%wybor%"=="5" call "%~dp0napraw_ethernet.bat"
if "%wybor%"=="6" call "%~dp0napraw_proxy_vpn.bat"
if "%wybor%"=="7" call "%~dp0napraw_firewall.bat"
if "%wybor%"=="8" call "%~dp0napraw_czas_data.bat"
if "%wybor%"=="9" call "%~dp0napraw_plan_zasilania.bat"
if "%wybor%"=="10" call "%~dp0napraw_sfc_dism.bat"
if "%wybor%"=="11" call "%~dp0czyszczenie_dysku_mega.bat"
if "%wybor%"=="12" call "%~dp0napraw_explorer_mega.bat"
if "%wybor%"=="13" call "%~dp0napraw_onedrive.bat"
if "%wybor%"=="14" call "%~dp0napraw_xbox_game_services.bat"
if "%wybor%"=="15" call "%~dp0napraw_skojarzenia_exe.bat"
if "%wybor%"=="16" call "%~dp0napraw_pulpit_ikony.bat"
if "%wybor%"=="17" call "%~dp0napraw_pdf_xps.bat"
if "%wybor%"=="18" call "%~dp0napraw_login_store.bat"
if "%wybor%"=="19" call "%~dp0napraw_dns_only.bat"
if "%wybor%"=="20" call "%~dp0napraw_startup_folder_only.bat"
if "%wybor%"=="21" exit /b

goto menu
