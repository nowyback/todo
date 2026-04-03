@echo off
echo Setting up GitHub Pages for file hosting...
echo.
echo 1. Create gh-pages branch:
git checkout --orphan gh-pages
git rm -rf .
echo.
echo 2. Create index.html:
echo ^<html^>^<head^>^<title^>Download Todoodle^</title^>^</head^>^<body^> > index.html
echo ^<h1^>Download Todoodle v0.9.1^</h1^> >> index.html
echo ^<a href="Todoodle%%20Setup%%200.9.0.exe" download^>Download Windows Installer^</a^> >> index.html
echo ^</body^>^</html^> >> index.html
echo.
echo 3. Copy installer:
copy "dist\Todoodle Setup 0.9.0.exe" .
echo.
echo 4. Commit and push:
git add .
git commit -m "Add v0.9.1 installer"
git push origin gh-pages
echo.
echo 5. Enable GitHub Pages in repository settings
echo 6. Download from: https://nowyback.github.io/todoodle/
echo.
pause
