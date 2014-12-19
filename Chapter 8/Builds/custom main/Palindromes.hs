module Palindromes where



import C'7 ( isPalin )




checkPalindrome :: IO ()
checkPalindrome

 =  do putStr "Think you a palindrome:\n\n"
       input <- getLine
       putStr (
                if   (isPalin input)
                then ("\nIt's one.")
                else ("\nIt's none.")
              )




