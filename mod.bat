@echo off

title Lex713's Workshop: Mod Pack Setup

echo ====================================================
echo  __                       ________    _     __     
echo /\ \                     /\_____  \ /' \  /'__`\   
echo \ \ \         __   __  _ \/___//'/'/\_, \/\_\L\ \  
echo  \ \ \  __  /'__`\/\ \/'\    /' /' \/_/\ \/_/_\_/_ 
echo   \ \ \L\ \/\  __/\/   _/   /' /'     \ \ \/\ \L\ \
echo    \ \____/\ \____\/\_/\_\ /\_/        \ \_\ \____/
echo     \/___/  \/____/\//\/_/ \//          \/_/\/___/ 
echo ====================================================
echo.

set SelectedPack=%~n0
set PackFolder=%~dpn0

echo You selected to install %SelectedPack% pack which located at: 
echo %PackFolder%
echo.
echo ====================================================
echo.

::Searching for game folder with help of registry
for /F "usebackq tokens=3*" %%A IN (`REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 784150" /v InstallLocation`) do (
    set appdir=%%A %%B
   )
echo Game located at:
echo %appdir%

::Set game media folder
set Media=%appdir: =%\media_soviet
echo.
echo ====================================================
echo.

::Copying textures to game folder
xcopy %PackFolder% %Media% /Y /S
if errorlevel 1 pause>nul|set/p =Installation aborted. Press any key to close this window
if errorlevel 1 exit																		::Catched an error so we exit by pressing any key

echo.
echo ====================================================
echo.

::Beep-beep, task completed!
Set "BEL=Echo/| CHOICE /N 2> nul"
%BEL%

if errorlevel 0 pause>nul|set/p =Installation completed! Press any key to close this window