@echo off
REM Kronos Web UI startup script for Windows

echo.
echo 🚀 Starting Kronos Web UI...
echo ================================

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python not installed, please install Python first
    echo Please download from https://www.python.org/downloads/
    pause
    exit /b 1
)

REM Check if in correct directory
if not exist "app.py" (
    echo ❌ Please run this script in the webui directory
    pause
    exit /b 1
)

REM Check dependencies
echo 📦 Checking dependencies...
python -c "import flask, flask_cors, pandas, numpy, plotly" >nul 2>&1
if errorlevel 1 (
    echo ⚠️  Missing dependencies, installing...
    pip install -r requirements.txt
    if errorlevel 1 (
        echo ❌ Dependencies installation failed
        pause
        exit /b 1
    )
    echo ✅ Dependencies installation completed
) else (
    echo ✅ All dependencies installed
)

REM Start application
echo.
echo 🌐 Starting Web server...
echo Access URL: http://localhost:7070
echo Press Ctrl+C to stop server
echo.

python app.py
pause
