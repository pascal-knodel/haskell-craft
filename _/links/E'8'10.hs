--
--
--
-----------------
-- Exercise 8.10.
-----------------
--
--
--
module E'8'10 where



-- Note: Chapter 7> cabal install

import E'7'33 ( isPalin )




-- More notes about compiling and examples are in the "build" directory.



checkPalindrome :: IO ()
checkPalindrome

 =  do putStrLn "\nThink you a palindrome ...\n\n"
       input <- getLine
       putStr (
                if   (isPalin input)
                then ("\n... It's one.")
                else ("\n... It's none.")
              )


-- Note: Compilation of E'8'10.hs
---------------------------------
--
--
--   * Make sure that imports are possible: use hardlinks or copies of the needed
--     file contents placed in the same directory of the importing module. You could
--     install them as a package too.
--
--        https://www.haskell.org/haskellwiki/How_to_write_a_Haskell_program
--
--
--   * Compile C'8.hs with the shell command  
--
--        ghc -main-is E'8'10.checkPalindrome E'8'10.hs -outputdir "compilation files" -o pcheck
--
--    (it shows how to specify entry points other than main
--    from where the compiled and linked program will start execution).



-- Shell> ghc -main-is E'8'10.checkPalindrome E'8'10.hs -outputdir "compilation files" -o pcheck
-- 
-- Shell> pcheck
--
-- Think you a palindrome (a-z, A-Z) ...
--
-- Never odd or even.
--
-- ... It's one.




