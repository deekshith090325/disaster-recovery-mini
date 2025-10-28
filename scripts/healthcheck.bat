@echo off
setlocal
set SOURCE_DIR=%~dp0..\app
if not exist "%SOURCE_DIR%" (
  echo Health Check FAILED: app directory missing!
  exit /b 1
) else (
  echo Health Check PASSED: app directory exists.
  exit /b 0
)
endlocal
