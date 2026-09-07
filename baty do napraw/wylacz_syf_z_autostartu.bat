@echo off
setlocal EnableExtensions
title Wylaczanie smieci z autostartu
color 0A

set "BACKUP_DIR=%USERPROFILE%\Desktop\Autostart_Backup"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%" >nul 2>&1

echo ==========================================
echo     Wylaczanie smieci z autostartu
echo ==========================================
echo.
echo Ten skrypt:
echo - usuwa popularne wpisy z autostartu
echo - przenosi skroty z folderu Startup do backupu
echo - nie odinstalowuje programow
echo.
echo Celuje m.in. w: Epic, Steam, Discord, Teams,
echo OneDrive, Adobe, Spotify, Skype, Telegram, Zoom.
echo.
echo Najlepiej uruchomic jako administrator.
echo Backup skrotow trafi tutaj:
echo %BACKUP_DIR%
echo.
pause

echo [1/5] Usuwanie wpisow Run z konta uzytkownika...
call :DeleteRunValue "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" "EpicGamesLauncher"
call :DeleteRunValue "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" "Steam"
call :DeleteRunValue "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" "Discord"
call :DeleteRunValue "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" "Teams"
call :DeleteRunValue "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" "com.squirrel.Teams.Teams"
call :DeleteRunValue "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" "OneDrive"
call :DeleteRunValue "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" "Spotify"
call :DeleteRunValue "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" "Skype"
call :DeleteRunValue "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" "Telegram"
call :DeleteRunValue "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" "Zoom"
call :DeleteRunValue "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" "Adobe Creative Cloud"
call :DeleteRunValue "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" "AdobeGCInvoker-1.0"
call :DeleteRunValue "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" "CCXProcess"
call :DeleteRunValue "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" "uTorrent"
call :DeleteRunValue "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" "Battle.net"
call :DeleteRunValue "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" "RiotClient"
call :DeleteRunValue "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" "EA app"
call :DeleteRunValue "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" "EpicGamesUpdateService"

echo [2/5] Usuwanie wpisow Run systemowych...
call :DeleteRunValue "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" "EpicGamesLauncher"
call :DeleteRunValue "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" "Steam"
call :DeleteRunValue "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" "Discord"
call :DeleteRunValue "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" "OneDrive"
call :DeleteRunValue "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" "Spotify"
call :DeleteRunValue "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" "Skype"
call :DeleteRunValue "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" "Telegram"
call :DeleteRunValue "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" "Zoom"
call :DeleteRunValue "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" "Adobe Creative Cloud"
call :DeleteRunValue "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" "AdobeGCInvoker-1.0"
call :DeleteRunValue "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" "CCXProcess"
call :DeleteRunValue "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" "Battle.net"
call :DeleteRunValue "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" "RiotClient"
call :DeleteRunValue "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" "EA app"
call :DeleteRunValue "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Run" "EpicGamesLauncher"
call :DeleteRunValue "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Run" "Steam"
call :DeleteRunValue "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Run" "Discord"
call :DeleteRunValue "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Run" "Battle.net"

echo [3/5] Czyszczenie folderow Startup...
call :MoveStartupMatch "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup" "*Epic*"
call :MoveStartupMatch "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup" "*Steam*"
call :MoveStartupMatch "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup" "*Discord*"
call :MoveStartupMatch "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup" "*Teams*"
call :MoveStartupMatch "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup" "*OneDrive*"
call :MoveStartupMatch "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup" "*Spotify*"
call :MoveStartupMatch "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup" "*Skype*"
call :MoveStartupMatch "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup" "*Telegram*"
call :MoveStartupMatch "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup" "*Zoom*"
call :MoveStartupMatch "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup" "*Adobe*"
call :MoveStartupMatch "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup" "*Epic*"
call :MoveStartupMatch "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup" "*Steam*"
call :MoveStartupMatch "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup" "*Discord*"
call :MoveStartupMatch "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup" "*Teams*"
call :MoveStartupMatch "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup" "*OneDrive*"
call :MoveStartupMatch "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup" "*Spotify*"
call :MoveStartupMatch "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup" "*Skype*"
call :MoveStartupMatch "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup" "*Telegram*"
call :MoveStartupMatch "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup" "*Zoom*"
call :MoveStartupMatch "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup" "*Adobe*"

echo [4/5] Zamykanie uruchomionych launcherow i nakladek...
for %%P in (EpicGamesLauncher.exe Steam.exe Discord.exe Teams.exe OneDrive.exe Spotify.exe Skype.exe Telegram.exe Zoom.exe Creative Cloud.exe CCXProcess.exe Battle.net.exe RiotClientServices.exe EADesktop.exe) do (
    taskkill /F /IM "%%P" >nul 2>&1
)

echo [5/5] Gotowe.
echo.
echo ==========================================
echo Autostart najczestszych smieci zostal ograniczony.
echo Jesli cos chcesz przywrocic, sprawdz backup:
echo %BACKUP_DIR%
echo.
echo Dla pelnego efektu zrestartuj komputer.
echo ==========================================
echo.
pause
endlocal
exit /b

:DeleteRunValue
reg delete %~1 /v %~2 /f >nul 2>&1
exit /b

:MoveStartupMatch
if not exist "%~1" exit /b
move "%~1\%~2" "%BACKUP_DIR%\" >nul 2>&1
exit /b
