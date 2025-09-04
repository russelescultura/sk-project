@echo off
echo ========================================
echo Revenue Table Migration Script
echo ========================================
echo.
echo This script will help you add the Revenue table to your database.
echo.
echo Steps:
echo 1. First, run get_program_ids.sql to see your existing programs
echo 2. Then run add_revenue_table.sql to create the Revenue table
echo 3. Finally, update your API routes and generate Prisma client
echo.
echo ========================================
echo.

echo Do you want to proceed? (Y/N)
set /p choice=

if /i "%choice%"=="Y" (
    echo.
    echo ========================================
    echo Step 1: Getting Program IDs
    echo ========================================
    echo Run this command in your MySQL client:
    echo mysql -u your_username -p your_database_name ^< get_program_ids.sql
    echo.
    echo ========================================
    echo Step 2: Creating Revenue Table
    echo ========================================
    echo Run this command in your MySQL client:
    echo mysql -u your_username -p your_database_name ^< add_revenue_table.sql
    echo.
    echo ========================================
    echo Step 3: Update API Routes
    echo ========================================
    echo After the database migration, update these files:
    echo - src/app/api/revenue/route.ts (uncomment the Prisma code)
    echo - src/app/api/budget/route.ts (uncomment the revenue code)
    echo.
    echo ========================================
    echo Step 4: Generate Prisma Client
    echo ========================================
    echo Run: npx prisma generate
    echo.
    echo ========================================
    echo Step 5: Test the Implementation
    echo ========================================
    echo Test the revenue functionality in your budget utilization page.
    echo.
) else (
    echo Migration cancelled.
)

pause 