@echo off


:: Check for administrative privileges ...

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"


:: If %ERRORLEVEL% is not 0 there are no administrative privileges and they need to be requested ...

if '%ERRORLEVEL%' NEQ '0' ( goto REQUEST_ADMINISTRATIVE_PRIVILEGES ) else ( goto ADMINISTRATIVE_PRIVILEGES_AVAILABLE )


:REQUEST_ADMINISTRATIVE_PRIVILEGES

:: Request administrative privileges ...

echo Set UAC = CreateObject^("Shell.Application"^) > "%TEMP%\rap.vbs"
set params = %*:"=""
echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%TEMP%\rap.vbs"

"%TEMP%\rap.vbs"
del "%TEMP%\rap.vbs"
exit /B


:ADMINISTRATIVE_PRIVILEGES_AVAILABLE

:: Administrative privileges are available now (or program exited).

cd /D "%~dp0"
cd links


set base=C:\Users\P\Desktop\haskell-craft


:: GitHub Ascending Order Whitespace (Hack)

for /L %%i in ( 3, 1,  9) do mklink C'%%i.hs "%base%\Chapter %%i\C'%%i.hs"

for /L %%i in ( 3, 1,  9) do ^
for /F "tokens=4 delims= " %%j in ('dir "%base%\Chapter %%i\E*.hs"') do ^
if exist "%base%\Chapter %%i\%%j" mklink %%j "%base%\Chapter %%i\%%j"

for /L %%i in ( 3, 1,  9) do ^
for /F "tokens=4 delims= " %%j in ('dir "%base%\Chapter %%i\B*.hs"') do ^
if exist "%base%\Chapter %%i\%%j" mklink %%j "%base%\Chapter %%i\%%j"


:: GitHub Ascending Order Non-Printable-Character Whitespace (Hack)

for /L %%i in (10, 1, 12) do mklink C'%%i.hs "%base%\Chapterÿ%%i\C'%%i.hs"

for /L %%i in (10, 1, 12) do ^
for /F "tokens=4 delims= " %%j in ('dir "%base%\Chapterÿ%%i\E*.hs"') do ^
if exist "%base%\Chapterÿ%%i\%%j" mklink %%j "%base%\Chapterÿ%%i\%%j"

for /L %%i in (10, 1, 12) do ^
for /F "tokens=4 delims= " %%j in ('dir "%base%\Chapterÿ%%i\B*.hs"') do ^
if exist "%base%\Chapterÿ%%i\%%j" mklink %%j "%base%\Chapterÿ%%i\%%j"




