@echo off
cls
echo ================================================
echo   Creating Netlify Deployment Package
echo ================================================
echo.
echo This will create a folder ready for Netlify...
echo.

REM Create deployment folder
if exist "netlify-deploy" rmdir /s /q "netlify-deploy"
mkdir "netlify-deploy"

echo Copying files...
xcopy ".next" "netlify-deploy\.next\" /E /I /H /Y
copy "package.json" "netlify-deploy\"
copy "package-lock.json" "netlify-deploy\"
copy "netlify.toml" "netlify-deploy\"
copy "next.config.ts" "netlify-deploy\"
xcopy "public" "netlify-deploy\public\" /E /I /H /Y

echo.
echo ================================================
echo   Package Created Successfully!
echo ================================================
echo.
echo Your deployment files are in: netlify-deploy\
echo.
echo NEXT STEPS:
echo 1. Go to https://app.netlify.com/drop
echo 2. Sign in or create account
echo 3. Drag the "netlify-deploy" folder to the browser
echo 4. Wait 2-3 minutes
echo 5. Your site is LIVE!
echo.
pause
