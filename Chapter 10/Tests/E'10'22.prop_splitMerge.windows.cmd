::
:: Windows CMD Script.
::
:: Generates a file that contains the QuickCheck test data
:: and the results for the property "prop_splitMerge" of ex. 10.22.
:: 
:: Note: This script needs the input file "E'10'22.prop_splitMerge.cmd.txt",
::       because it uses command redirection.
::
::   Tested on Windows 8.1.
::
@echo off

cd ..

ghci < "Tests\E'10'22.prop_splitMerge.cmd.txt" > "Tests\E'10'22.prop_splitMerge.verboseCheck.txt"

echo.
echo Press ENTER to exit ...

pause >NUL
exit