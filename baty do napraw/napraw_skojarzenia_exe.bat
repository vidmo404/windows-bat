@echo off
setlocal EnableExtensions
title Naprawa skojarzen EXE
color 0C
echo Naprawa skojarzen plikow EXE...
reg add "HKCR\.exe" /ve /d exefile /f >nul 2>&1
reg add "HKCR\exefile\shell\open\command" /ve /d "\"%%1\" %%*" /f >nul 2>&1
echo Gotowe.
pause
endlocal
