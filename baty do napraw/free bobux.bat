@echo off
title System Lock
color 0f
cls

:: Zapisz bieżącą konfigurację
set "startup_path=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"
set "script_name=%~nx0"

:: Dodaj do autostartu jeśli nie istnieje
if not exist "%startup_path%\%script_name%" (
    copy "%~f0" "%startup_path%\%script_name%" >nul
)

:: Uruchom jako pełny ekran
start "" /max "%~f0" lock
exit /b

:lock
:: Ukryj pasek zadań
powershell -command "&{$p='HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3';$v=(Get-ItemProperty -Path $p).Settings;$v[8]=3;&Set-ItemProperty -Path $p -Name Settings -Value $v;&Stop-Process -ProcessName explorer}"
timeout /t 1 >nul

:: Ustaw pełny ekran
mode con cols=200 lines=60
powershell -windowstyle maximized -command "&{ $host.ui.RawUI.WindowTitle = 'System Lock' }"

:: Wyłącz przyciski systemowe (Ctrl+Alt+Del, Alt+F4, itp.)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableLockWorkstation /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableChangePassword /t REG_DWORD /d 1 /f >nul 2>&1

cls

:start
:: Wyczyść ekran i wyświetl hasło na środku
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                   ====================================
echo                                   ===  SYSTEM ZABLOKOWANY  ===
echo                                   ====================================
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.

set /p "input=                                   Wpisz hasło: "

if /i "%input%"=="shadow" (
    :: Przywróć pasek zadań
    powershell -command "&{$p='HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3';$v=(Get-ItemProperty -Path $p).Settings;$v[8]=2;&Set-ItemProperty -Path $p -Name Settings -Value $v;&Start-Process explorer}"
    
    :: Przywróć ustawienia systemowe
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /f >nul 2>&1
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableLockWorkstation /f >nul 2>&1
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableChangePassword /f >nul 2>&1
    
    :: Usuń z autostartu
    if exist "%startup_path%\%script_name%" (
        del "%startup_path%\%script_name%" >nul
    )
    
    cls
    echo.
    echo   System odblokowany! Za chwilę nastąpi restart eksploratora...
    timeout /t 3 >nul
    
    :: Restart eksploratora dla pewności
    taskkill /f /im explorer.exe >nul 2>&1
    start explorer.exe
    
    exit
) else (
    cls
    echo.
    echo   Błędne hasło!
    timeout /t 2 >nul
    goto start
)