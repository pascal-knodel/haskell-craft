@echo off
echo.
::
:: Compile the Haskell module "Palindrome.hs" which has a custom main function.
:: ...
::



ghc --make Palindromes -main-is Palindromes.checkPalindrome -outputdir "%CD%\compilation files" -o pcheck

:: Option       Argument
:: ::::::::::   :::::::::::::::::::::::::::::::::::::::::::::::
:: --make       Input file.
:: -main-is     Name of the main function.
:: -outputdir   Directory for compilation files (.hi, .o, ...).
:: -o           Executable name.
::


echo.
echo Press ENTER to exit ...

pause >NUL
exit