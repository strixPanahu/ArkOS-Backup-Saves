@echo off
echo ---------------------------------------------------
echo                 ArkOS Saves Script                 
echo  https://github.com/strixPanahu/ArkOS-Backup-Saves
echo ---------------------------------------------------
echo.

REM Housekeeping
set sourceDirectory=%~dp0
setlocal
set /p "destinationDirectory=Choose a backup destination, or press enter to skip:"
if not defined destinationDirectory (
    set "destinationDirectory=C:\Users\%USERNAME%\Downloads\Game Saves\"
)
echo.


if not exist "%destinationDirectory%" (
    mkdir "%destinationDirectory%"
)

REM Copy each .srm (save) and .state (state) file to the destination directory
for /r "%sourceDirectory%" %%f in (*.srm *.save) do (
    set "relativePath=%%f"
    setlocal enabledelayedexpansion
    set "relativePath=!relativePath:%sourceDirectory%=!"

    set "destinationPath=%destinationDirectory%!relativePath!"

    for %%G in ("!destinationPath!") do if not exist "%%~dpG" mkdir "%%~dpG"

    copy /y "%%f" "!destinationPath!" >nul
    echo Copied %%f
    endlocal
)
echo.

echo All games saves successfully copied to your Downloads folder.
%SYSTEMROOT%\explorer.exe /e,%destinationDirectory%
echo.
pause