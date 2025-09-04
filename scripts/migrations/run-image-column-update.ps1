# PowerShell script to run the image column update
# This script will execute the SQL file to add the image column

Write-Host "Adding image column to locations table..." -ForegroundColor Green

# Check if MySQL is available
try {
    mysql --version | Out-Null
    Write-Host "MySQL found!" -ForegroundColor Green
} catch {
    Write-Host "MySQL not found in PATH. Please make sure MySQL is installed and added to PATH." -ForegroundColor Red
    Write-Host "Alternative: You can run this SQL manually in phpMyAdmin or MySQL Workbench." -ForegroundColor Yellow
    exit 1
}

# Prompt for MySQL credentials
$username = Read-Host "Enter MySQL username (default: root)"
if ([string]::IsNullOrEmpty($username)) {
    $username = "root"
}

$password = Read-Host "Enter MySQL password" -AsSecureString
$passwordPlain = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))

Write-Host "Executing SQL script..." -ForegroundColor Yellow

# Run the SQL script
try {
    mysql -u $username -p$passwordPlain < add-image-column.sql
    Write-Host "✅ Successfully added image column to locations table!" -ForegroundColor Green
} catch {
    Write-Host "❌ Error executing SQL script: $_" -ForegroundColor Red
    Write-Host "You can manually run the SQL commands from 'add-image-column.sql' file." -ForegroundColor Yellow
}

Write-Host "`nNext steps:" -ForegroundColor Cyan
Write-Host "1. Restart your Next.js development server" -ForegroundColor White
Write-Host "2. The image upload feature should now work properly" -ForegroundColor White
Write-Host "3. You can start adding locations with images!" -ForegroundColor White

Read-Host "`nPress Enter to exit"