--
--
--
-----------------
-- Exercise 8.11.
-----------------
--
--
--
module E'8'11 where



import Data.Char ( isDigit )




sum2integers :: IO ()
sum2integers

 =  do putStr "\nSum two integers ...\n\n\
              \First:\n\n"   -- Haskell multiline string.
       potentialFirstInteger <- getLine
       putStr "\n"
       if   (isInteger potentialFirstInteger)
       then (putStr "Second:\n\n")
       else (error "This is not an integer.")
       potentialSecondInteger <- getLine
       putStr "\n"
       if   (isInteger potentialSecondInteger)
       then (
              putStr (
                       "Result of integer addition:\n\n" 
                       ++ (
                            show (
                                       (read potentialFirstInteger)
                                    +  (read potentialSecondInteger)
                                 )
                          )
					   ++ "\n"
                     )
            )
       else (error "This is not an integer.")


isInteger :: String -> Bool
isInteger [] = False
isInteger potentialInteger@(potentialSign : potentialRemainingDigits)
 
 =  case (potentialSign) of
    '-' -> isInteger' potentialRemainingDigits
    _   -> isInteger' potentialInteger
 
 where
 
 isInteger' :: String -> Bool
 isInteger' [] = True
 isInteger' (potentialDigit : remainingPotentialDigits)
 
  =  isDigit potentialDigit  &&  isInteger' remainingPotentialDigits


-- Shell> ghc -main-is E'8'11.sum2integers E'8'11.hs -outputdir "%CD%\compilation files" -o sum2i
--
-- Shell> sum2i
--
-- Sum two integers ...
-- 
-- First:
-- 
-- 1
-- 
-- Second:
-- 
-- -1
-- 
-- Result of integer addition:
-- 
-- 0




