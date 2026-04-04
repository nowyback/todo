# PowerShell script to create Todoodle server zip package
$ErrorActionPreference = "Continue"

Write-Host "Creating Todoodle Server v0.11.4.zip..." -ForegroundColor Green

# Get current directory
$CurrentDir = Get-Location
Write-Host "Current directory: $CurrentDir" -ForegroundColor Yellow

# Create zip file using PowerShell Compress-Archive
try {
    $SourcePath = Join-Path $CurrentDir "server-setup"
    $DestinationPath = Join-Path $CurrentDir "todoodle-server-v0.11.4.zip"
    
    Write-Host "Creating zip from: $SourcePath" -ForegroundColor Cyan
    Write-Host "Destination: $DestinationPath" -ForegroundColor Cyan
    
    # Create the zip file
    Add-Type -Path $SourcePath -DestinationPath $DestinationPath -Force
    Write-Host "Server package created successfully!" -ForegroundColor Green
    
    # Show file info
    $ZipFile = Get-Item $DestinationPath
    Write-Host "File size: $([math]::Round($ZipFile.Length / 1MB, 2)) MB" -ForegroundColor Green
    Write-Host "File location: $DestinationPath" -ForegroundColor Green
    
} catch {
    Write-Host "Error creating zip file: $($_)" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Installation instructions:" -ForegroundColor Yellow
Write-Host "1. Extract todoodle-server-v0.11.4.zip" -ForegroundColor Cyan
Write-Host "2. cd todoodle-server" -ForegroundColor Cyan
Write-Host "3. npm install" -ForegroundColor Cyan
Write-Host "4. npm run server" -ForegroundColor Cyan
Write-Host ""
Write-Host "The server will start on http://localhost:3001" -ForegroundColor Green
