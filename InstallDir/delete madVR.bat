@echo off
if exist "%localappdata%\madVR" goto deinstalacja
if not exist "%localappdata%\madVR" goto nie istnieje

:deinstalacja
@regsvr32.exe madVR.ax /u /s
@if not exist "%SystemRoot%\SysWOW64\cmd.exe" goto sukces
@regsvr32.exe madVR64.ax /u /s
:sukces
@echo.
@echo.
@echo    Deinstalacja zakonczyła sie pomyslnie.
@echo.
@goto usun folder

:usun folder
RD /S /Q %localappdata%\madVR

exit

:nie istnieje
exit