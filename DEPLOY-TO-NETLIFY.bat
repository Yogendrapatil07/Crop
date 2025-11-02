@echo off
cls
echo ========================================
echo Smart Crop Tech - Deploy to Netlify
echo ========================================
echo.

echo [STEP 1] Logging in to Netlify...
echo Browser will open - click "Authorize"
echo.
netlify login

echo.
echo [STEP 2] Deploying your site...
echo.
echo Answer these questions:
echo - Create new site? Type: y
echo - Team: Choose your team (use arrow keys)
echo - Site name: Type: smart-crop-tech
echo - Publish directory: Type: .next
echo.
pause

netlify deploy --prod --dir=.next

echo.
echo ========================================
echo DEPLOYMENT COMPLETE!
echo ========================================
echo.
echo Your site is now LIVE on Netlify!
echo Check the URL shown above.
echo.
pause
