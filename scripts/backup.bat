@echo off
setlocal enabledelayedexpansion
set BACKUP_DIR=%~dp0..\backup
set SOURCE_DIR=%~dp0..\app
for /f "tokens=1-3 delims=/: " %%a in ('echo %date%') do set d=%%c%%a%%b
for /f "tokens=1-2 delims=:." %%a in ("%time%") do set t=%%a%%b
set TIMESTAMP=%d%_%t%
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%"
xcopy "%SOURCE_DIR%" "%BACKUP_DIR%\app_backup_%TIMESTAMP%" /E /I /Y >nul
echo Backup created successfully at %BACKUP_DIR%\app_backup_%TIMESTAMP%
endlocal
