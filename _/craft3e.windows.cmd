@echo off


cd links


SETLOCAL ENABLEDELAYEDEXPANSION

:: Make Haskell module which imports every single exercise module (and dependencies).

echo module Craft3e where>Craft3e.hs
echo.>>Craft3e.hs

for /F "tokens=4 delims= " %%j in ('dir "E*.hs"') do if exist "%%j" (

set module=%%j
:: TODO FIXME strip .hs
echo import !module!>>Craft3e.hs

)


exit