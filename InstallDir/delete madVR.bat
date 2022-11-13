@echo off
if exist "%APPDATA%\madVR" goto deinstalacja
if not exist "%APPDATA%\madVR" goto nie istnieje

:deinstalacja
@regsvr32.exe madVR.ax /u /s
@if not exist "%SystemRoot%\SysWOW64\cmd.exe" goto sukces
@regsvr32.exe madVR64.ax /u /s
:sukces
@echo.
@echo.
@echo    Deinstalacja zakonczy³a sie pomyslnie.
@echo.
@goto usun folder

:usun folder
RD /S /Q %APPDATA%\madVR

exit

:nie istnieje
exit