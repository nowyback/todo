@echo off
REM Todoodle Server Installation Script for Windows
REM This script installs and configures Todoodle server

echo.
echo ========================================
echo   Todoodle Server Installation
echo ========================================
echo.

REM Colors
set "RED=[91m"
set "GREEN=[92m"
set "YELLOW=[93m"
set "BLUE=[94m"
set "NC=[0m"

REM Function to print colored output
:print_status
echo %GREEN%*[INFO]%NC% %~1
goto :eof

:print_warning
echo %YELLOW%*[WARNING]%NC% %~1
goto :eof

:print_error
echo %RED%*[ERROR]%NC% %~1
goto :eof

REM Check if Node.js is installed
echo Checking system requirements...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    call :print_error "Node.js is not installed"
    echo Please install Node.js 16+ from https://nodejs.org/
    pause
    exit /b 1
)
for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
call :print_status "Node.js found: %NODE_VERSION%"

REM Check if npm is installed
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    call :print_error "npm is not installed"
    echo Please install npm (comes with Node.js)
    pause
    exit /b 1
)
for /f "tokens=*" %%i in ('npm --version') do set NPM_VERSION=%%i
call :print_status "npm found: %NPM_VERSION%"

REM Install dependencies
echo.
echo Installing dependencies...
npm install
if %errorlevel% neq 0 (
    call :print_error "Failed to install dependencies"
    pause
    exit /b 1
)
call :print_status "Dependencies installed successfully"

REM Create necessary directories
echo.
echo Creating necessary directories...
if not exist "data" (
    mkdir data
    call :print_status "Created data directory"
)

if not exist "logs" (
    mkdir logs
    call :print_status "Created logs directory"
)

if not exist "backups" (
    mkdir backups
    call :print_status "Created backups directory"
)

REM Create default configuration
if not exist "src\api-config.json" (
    echo.
    echo Creating default configuration...
    (
        echo {
        echo   "address": "localhost",
        echo   "port": 3001
        echo }
    ) > src\api-config.json
    call :print_status "Default configuration created"
) else (
    call :print_warning "Configuration file already exists"
)

REM Create startup script
echo.
echo Creating startup script...
(
    echo @echo off
    echo REM Todoodle Server Startup Script for Windows
    echo.
    echo REM Get the directory where this script is located
    echo set "DIR=%~dp0"
    echo.
    echo REM Change to the directory
    echo cd /d "%%DIR%%"
    echo.
    echo REM Start the server
    echo echo Starting Todoodle Server...
    echo npm run server
    echo.
    echo pause
) > start-server.bat
call :print_status "Startup script created: start-server.bat"

REM Test server installation
echo.
echo Testing server installation...
echo Starting server for testing...

REM Start server in background
start /B npm run server

REM Wait for server to start
timeout /t 5 /nobreak >nul

REM Test health endpoint
curl -s http://localhost:3001/api/health >nul 2>&1
if %errorlevel% equ 0 (
    call :print_status "Server is running correctly!"
    call :print_status "Health check passed"
    
    REM Stop the test server
    taskkill /F /IM node.exe >nul 2>&1
    call :print_status "Test server stopped"
) else (
    call :print_error "Server health check failed"
    echo Please check the installation
    pause
    exit /b 1
)

REM Display next steps
echo.
echo.
echo %GREEN%*[SUCCESS]%NC% Installation completed successfully!
echo.
echo %BLUE%Next Steps:%NC%
echo 1. Start the server:
echo    npm run server
echo.
echo 2. Or use the startup script:
echo    start-server.bat
echo.
echo 3. Access the application:
echo    http://localhost:3001
echo.
echo 4. For production deployment:
echo    - Set environment variables (HOST, PORT)
echo    - Use process manager (PM2, Windows Service)
echo    - Set up reverse proxy (IIS, Nginx)
echo.
echo 5. Configuration:
echo    - Edit src\api-config.json for custom settings
echo    - Use environment variables for production
echo    - See docs\SERVER_SETUP.md for detailed guide
echo.
echo 6. Windows Service (optional):
echo    - Install NSSM (Non-Sucking Service Manager)
echo    - Run: nssm install TodoodleServer "npm run server"
echo.
echo %BLUE%Documentation:%NC%
echo   - Server Setup: docs\SERVER_SETUP.md
echo   - Console Guide: docs\CONSOLE.md
echo   - API Docs: http://localhost:3001/api-docs
echo.
echo %GREEN%Happy server deployment!%NC%
echo.
pause
