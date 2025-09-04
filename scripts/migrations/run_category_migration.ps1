# PowerShell script to run the category migration
# This script executes the MySQL command to add the category column

Write-Host "Adding category column to programs table..." -ForegroundColor Green

# MySQL connection details (update these if needed)
$mysqlHost = "localhost"
$mysqlPort = "3306"
$mysqlUser = "root"
$mysqlPassword = ""
$database = "sk_project"

# Path to the SQL file
$sqlFile = "add_category_to_programs.sql"

# Check if the SQL file exists
if (-not (Test-Path $sqlFile)) {
    Write-Host "Error: SQL file '$sqlFile' not found!" -ForegroundColor Red
    exit 1
}

# Build the MySQL command
$mysqlCommand = "mysql -h $mysqlHost -P $mysqlPort -u $mysqlUser"

# Add password if provided
if ($mysqlPassword) {
    $mysqlCommand += " -p$mysqlPassword"
}

$mysqlCommand += " $database < $sqlFile"

Write-Host "Executing: $mysqlCommand" -ForegroundColor Yellow

# Execute the MySQL command
try {
    Invoke-Expression $mysqlCommand
    Write-Host "Category column added successfully!" -ForegroundColor Green
    Write-Host "You can now use the category field in your application." -ForegroundColor Green
} catch {
    Write-Host "Error executing MySQL command: $_" -ForegroundColor Red
    Write-Host "Please check your MySQL connection details and try again." -ForegroundColor Red
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") 