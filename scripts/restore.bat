@echo off
setlocal enabledelayedexpansion
set BACKUP_DIR=%~dp0..\backup
set SOURCE_DIR=%~dp0..\app
for /f "delims=" %%F in ('dir "%BACKUP_DIR%\app_backup_*" /b /o:-d 2^>nul') do (
  set LATEST=%%F
  goto :found
)
:found
if "%LATEST%"=="" (
  echo No backups found in %BACKUP_DIR%!
  exit /b 1
)
rd /s /q "%SOURCE_DIR%" 2>nul
xcopy "%BACKUP_DIR%\%LATEST%" "%SOURCE_DIR%" /E /I /Y >nul
echo Restored app from %BACKUP_DIR%\%LATEST%
endlocal
