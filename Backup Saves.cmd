@echo off

echo --------------------------
echo ArkOS Saves Script
echo https://github.com/strixPanahu/ArkOS-Backup-Saves
echo --------------------------
echo.

REM Housekeeping
set /p backupDir="Choose a backup destination, or press enter to skip:"
echo.

setlocal
set sourceDirectory=%~dp0
set "destinationDirectory=C:\Users\%USERNAME%\Downloads\Game Saves\"

if not exist "%destinationDirectory%" (
    mkdir "%destinationDirectory%"
)

REM Copy each .srm (save) and .state (state) file to the destination directory
for /r "%sourceDirectory%" %%f in (*.*) do (
     if /i "%%~xf"==".srm" (
	echo Copying %%f
        copy "%%f" "%destinationDirectory%" >nul
    ) else if /i "%%~xf"==".state" (
	echo Copying %%f
        copy "%%f" "%destinationDirectory%" >nul
    )
)

echo.
echo All games saves successfully copied to your Downloads folder.
%SYSTEMROOT%\explorer.exe /e,%destinationDirectory%
echo.
pause

endlocal