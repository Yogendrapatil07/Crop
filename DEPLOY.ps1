# Smart Crop Technologies - One-Click Netlify Deploy
# Run this script to deploy your site

Write-Host "========================================" -ForegroundColor Green
Write-Host "Smart Crop Tech - Automated Deploy" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Check if netlify CLI is installed
Write-Host "Checking Netlify CLI..." -ForegroundColor Yellow
$netlifyInstalled = Get-Command netlify -ErrorAction SilentlyContinue

if (-not $netlifyInstalled) {
    Write-Host "Installing Netlify CLI..." -ForegroundColor Yellow
    npm install -g netlify-cli
}

Write-Host "✓ Netlify CLI ready" -ForegroundColor Green
Write-Host ""

# Build the project
Write-Host "Building project..." -ForegroundColor Yellow
npm run build

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Build successful!" -ForegroundColor Green
    Write-Host ""
    
    # Deploy
    Write-Host "Starting deployment..." -ForegroundColor Yellow
    Write-Host "A browser window will open for authentication." -ForegroundColor Cyan
    Write-Host "After login, return here and answer the questions." -ForegroundColor Cyan
    Write-Host ""
    
    netlify deploy --prod --dir=.next
    
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "Deployment Complete!" -ForegroundColor Green
    Write-Host "Check the URL above to see your live site" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
} else {
    Write-Host "✗ Build failed. Check errors above." -ForegroundColor Red
}

Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
