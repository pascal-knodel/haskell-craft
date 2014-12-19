@echo off

ghc ^
 -prof ^
 -fprof-auto ^
 -rtsopts ^
 --make Length ^
 -main-is Length.profile ^
 -outputdir "%CD%\compilation files" ^
 -o length.exe >NUL

:: -O0               No compiler optimization.
:: -fno-strictness   No strictness analysis.
:: -prof             Compile and link for profiling.
:: -fprof-auto       Auto annotations. See docs.
:: -rtsopts          RTS command line options. See docs.
:: --make            Build <module name>
:: -outputdir        Set output directory for intermediate files.
:: -o                Set executable name.

:: https://downloads.haskell.org/~ghc/7.8.3/docs/html/users_guide/prof-compiler-options.html


length +RTS -p >NUL

:: +RTS   Run Time Statistics
:: -p     Write standard time profile into <program name>.prof

:: https://downloads.haskell.org/~ghc/7.8.3/docs/html/users_guide/prof-time-options.html