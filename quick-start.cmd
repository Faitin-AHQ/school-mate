@echo off
cd /d "%~dp0"

echo ============================================
echo   School Mate - Astro Quick Start
echo ============================================
echo.

if not exist "node_modules\" (
  echo [info] node_modules not found, running npm install...
  call npm install
  if errorlevel 1 (
    echo [error] npm install failed. Please run it manually.
    pause
    exit /b 1
  )
)

echo [info] Starting Astro dev server...
echo [info] Open  http://localhost:4321  in your browser.
echo [info] Press  Ctrl+C  to stop.
echo.

call npm run dev
