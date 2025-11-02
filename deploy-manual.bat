@echo off
echo ========================================
echo Smart Crop Tech - Manual Netlify Deploy
echo ========================================
echo.
echo Step 1: Building project...
call npm run build
echo.
echo Step 2: Ready to deploy!
echo.
echo Run this command to deploy:
echo netlify deploy --prod
echo.
pause
