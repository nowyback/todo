@echo off
echo Creating GitHub Pages branch for file hosting...
echo.
echo 1. Create and switch to gh-pages branch:
git checkout --orphan gh-pages
echo.
echo 2. Create simple index.html:
echo ^<html^>^<head^>^<title^>Download Todoodle^</title^>^<style^>body{font-family:Arial,sans-serif;background:#020202;color:#d1d5db;text-align:center;padding:40px}a{background:#6366f1;color:white;padding:15px 30px;text-decoration:none;border-radius:8px}a:hover{background:#5558e3}^</style^>^</head^>^<body^> > index.html
echo ^<h1^>Download Todoodle v0.9.1^</h1^> >> index.html
echo ^<p^>Minimalist task manager for developers^</p^> >> index.html
echo ^<br^> >> index.html
echo ^<a href="Todoodle%%20Setup%%200.9.0.exe" download^>Download Windows Installer (84MB)^</a^> >> index.html
echo ^<br^>^<br^> >> index.html
echo ^<small^>Requires Windows 10+^</small^> >> index.html
echo ^</body^>^</html^> >> index.html
echo.
echo 3. Copy installer to branch:
copy "dist\Todoodle Setup 0.9.0.exe" .
echo.
echo 4. Add and commit files:
git add .
git commit -m "Add v0.9.1 installer and download page"
echo.
echo 5. Push to GitHub:
git push origin gh-pages
echo.
echo 6. Enable GitHub Pages in repository settings!
echo 7. Download from: https://nowyback.github.io/todoodle/
echo.
pause
