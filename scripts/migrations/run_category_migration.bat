@echo off
echo Adding category column to programs table...

REM MySQL connection details (update these if needed)
set MYSQL_HOST=localhost
set MYSQL_PORT=3306
set MYSQL_USER=root
set MYSQL_PASSWORD=
set DATABASE=sk_project

REM Path to the SQL file
set SQL_FILE=add_category_to_programs.sql

REM Check if the SQL file exists
if not exist "%SQL_FILE%" (
    echo Error: SQL file '%SQL_FILE%' not found!
    pause
    exit /b 1
)

REM Build the MySQL command
set MYSQL_CMD=mysql -h %MYSQL_HOST% -P %MYSQL_PORT% -u %MYSQL_USER%

REM Add password if provided
if not "%MYSQL_PASSWORD%"=="" (
    set MYSQL_CMD=%MYSQL_CMD% -p%MYSQL_PASSWORD%
)

set MYSQL_CMD=%MYSQL_CMD% %DATABASE% ^< %SQL_FILE%

echo Executing: %MYSQL_CMD%

REM Execute the MySQL command
%MYSQL_CMD%

if %ERRORLEVEL% EQU 0 (
    echo.
    echo Category column added successfully!
    echo You can now use the category field in your application.
) else (
    echo.
    echo Error executing MySQL command!
    echo Please check your MySQL connection details and try again.
)

echo.
pause 