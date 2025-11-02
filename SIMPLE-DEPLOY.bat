@echo off
cls
color 0A
echo ================================================
echo   Smart Crop Technologies - Netlify Deploy
echo ================================================
echo.
echo This will deploy your site to Netlify.
echo.
echo IMPORTANT: Make sure you have:
echo   1. A Netlify account (free at netlify.com)
echo   2. Internet connection
echo.
pause

echo.
echo [1/3] Logging into Netlify...
echo (A browser window will open)
echo.
call netlify login

if errorlevel 1 (
    echo.
    echo ERROR: Failed to login to Netlify
    echo Please check your internet connection
    pause
    exit /b 1
)

echo.
echo [2/3] Linking to Netlify site...
echo.
call netlify init

if errorlevel 1 (
    echo.
    echo ERROR: Failed to initialize site
    pause
    exit /b 1
)

echo.
echo [3/3] Deploying to production...
echo.
call netlify deploy --prod

echo.
echo ================================================
echo   DEPLOYMENT COMPLETE!
echo ================================================
echo.
echo Your site is now live!
echo The URL is shown above.
echo.
pause
