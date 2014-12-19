--
--
--
-----------------
-- Exercise 8.13.
-----------------
--
--
--
module E'8'13 where



import E'8'11 ( isInteger )

import Data.Char ( isDigit )




sumIntegers :: IO ()
sumIntegers

 =  do putStr "\nNumber of integers to sum up:\n\n"
       input <- getLine
       putStr "\n"
       if   (isNumeric input)
       then (
              if    (
                           input /= "0"
                       &&  input /= "1"
                    )
               then (
                      do putStr "Your integers:\n\n"
                         sum <- sumIntegers' (read input :: Integer) 0
                         putStr "\nTheir sum is:\n\n"
                         putStr ( (show sum) ++ "\n\n" )
                    )
               else (
                      do putStr "... Exception: at least two integers, again:\n\n"
                         sumIntegers
                    )
            )
       else (
              do putStr "... Exception: This is not a (positive) number, again:\n\n"
                 sumIntegers
            )
 
 where
 
 sumIntegers' :: Integer -> Integer -> IO Integer
 sumIntegers' 0 carry = return carry
 sumIntegers' number carry   -- "carry" is 'loop data' 
                             -- ('transferring information to the next recursion step through the argument').
 
  =  do input <- getLine
        if   (isInteger input)
        then (
               sumIntegers' (number - 1) (carry + (read input :: Integer))
             )
        else (
               do putStr "... Exception: This is not an integer, again:\n"
                  sumIntegers' number carry
             )


isNumeric :: String -> Bool
isNumeric [] = False
isNumeric numericString
 
 =  isNumeric' numericString
 
 where
 
 isNumeric' :: String -> Bool
 isNumeric' [] = True
 isNumeric' (character : remainingCharacters)
 
  =  isDigit character  &&  isNumeric' remainingCharacters


-- GHCi> sumIntegers
--
-- Number of integers to sum up:
--
-- 2
-- 
-- Your integers:
--
-- 1
-- 2
-- 
-- Their sum is:
--
-- 3




