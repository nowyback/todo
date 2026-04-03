@echo off
echo Creating desktop shortcut for Todoodle...
powershell "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%USERPROFILE%\Desktop\Todoodle.lnk'); $Shortcut.TargetPath = '%CD%\start.bat'; $Shortcut.WorkingDirectory = '%CD%'; $Shortcut.IconLocation = '%CD%\src\icon.ico,0'; $Shortcut.Save()"
echo Desktop shortcut created! You can now double-click "Todoodle" on your desktop.
pause
