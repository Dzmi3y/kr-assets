@echo off
chcp 65001 > nul
title Local Server for Flutter

set "PORT=55555"

echo [1/2] Checking http-server...
call npm list -g http-server --depth=0 >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] http-server not found. Installing globally...
    call npm install -g http-server
) else (
    echo [ OK ] http-server is already installed.
)

echo [2/2] Starting server in the current directory...
echo 💡 For Flutter emulator use: http://10.0.2.2:%PORT%/filename
echo ❌ Close this window to stop the server.
echo --------------------------------------------------

call http-server -p %PORT% --cors

pause
