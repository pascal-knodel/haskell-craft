@echo off
echo.
::
:: Compile a Haskell Main module ...
::



ghc --make Palindromes -outputdir "%CD%\compilation files" -o pcheck

:: Option       Argument
:: ::::::::::   :::::::::::::::::::::::::::::::::::::::::::::::
:: --make       Input file.
:: -outputdir   Directory for compilation files (.hi, .o, ...).
:: -o           Executable name.
::


echo.
echo Press ENTER to exit ...

pause >NUL
exit