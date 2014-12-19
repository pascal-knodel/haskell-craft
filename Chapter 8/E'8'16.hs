--
--
--
-----------------
-- Exercise 8.16.
-----------------
--
--
--
module E'8'16 where



-- Note: Chapter 7> cabal install

import E'7'33 ( isPalin )




checkPalindromes :: IO ()
checkPalindromes

 =  do putStr "\nThink you palindromes (after each input, a message indicates\n\
              \if it is a palindrome or not, abort with 'no input and press ENTER'):\n\n"
       checkPalindromes'
 
 where
 
 checkPalindromes' :: IO ()
 checkPalindromes' 
 
  =  do input <- getLine
        if   (input /= "")
        then (
               do if   (isPalin input)
                  then (putStr "... It's one.\n\n")
                  else (putStr "... It's none.\n\n")
                  checkPalindromes'
             )
        else return ()


-- GHCi> checkPalindromes
--
-- Think you palindromes (after each input, a message indicates
-- if it is a palindrome or not, abort with 'no input and press ENTER'):
-- 
-- Dog god.
-- ... It's one.
-- 
-- Good dog.
-- ... It's none.




