@echo off
echo Adding image column to locations table...
echo.

REM Check if MySQL is available
mysql --version >nul 2>&1
if %errorlevel% neq 0 (
    echo MySQL not found in PATH. 
    echo Please make sure MySQL is installed and added to PATH.
    echo Alternative: You can run the SQL manually in phpMyAdmin or MySQL Workbench.
    pause
    exit /b 1
)

echo MySQL found!
echo.

REM Prompt for credentials
set /p username="Enter MySQL username (default: root): "
if "%username%"=="" set username=root

set /p password="Enter MySQL password: "

echo.
echo Executing SQL script...
mysql -u %username% -p%password% < add-image-column.sql

if %errorlevel% equ 0 (
    echo.
    echo ✅ Successfully added image column to locations table!
    echo.
    echo Next steps:
    echo 1. Restart your Next.js development server
    echo 2. The image upload feature should now work properly
    echo 3. You can start adding locations with images!
) else (
    echo.
    echo ❌ Error executing SQL script
    echo You can manually run the SQL commands from 'add-image-column.sql' file.
)

echo.
pause