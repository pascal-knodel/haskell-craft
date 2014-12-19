--
--
--
-----------------
-- Exercise 5.19.
-----------------
--
--
--
module E'5'19 where



import Prelude hiding ( toUpper , isLower )

import qualified Data.Char ( toUpper , isLower )




-- To implement capitalize we could reuse solutions from earlier exercises ...


-- Exercise 3.16 (solution of it).


upperLowerCaseOffset :: Int
upperLowerCaseOffset =  (fromEnum 'a') - (fromEnum 'A')


isLower :: Char -> Bool
isLower aChar

 |      (aChar >= 'a')
    &&  (aChar <= 'z')  = True
 |  otherwise           = False


toUpper :: Char -> Char
toUpper aChar

 | isLower aChar  = toEnum ( (fromEnum aChar) - upperLowerCaseOffset )
 | otherwise      = aChar
      
      
-- ...



capitalize :: String -> String
capitalize s

 =  [ toUpper l | l <- s ]


{- GHCi>

capitalize "a=1 ; b=2 ; c=3 ;"

-}
-- "A=1 ; B=2 ; C=3 ;"


capitalizeLetters :: String -> String
capitalizeLetters s

 =  [ toUpper l | l <- s, isLower l ]

{- GHCi>

capitalizeLetters "a=1 ; b=2 ; c=3 ;"

-}
-- "ABC"



-- Other solutions for "capitalize" and "capitalizeLetters":


capitalize' :: String -> String
capitalize' s

 =  [ Data.Char.toUpper l | l <- s ]


capitalizeLetters' :: String -> String
capitalizeLetters' s

 =  [ toUpper l | l <- s, Data.Char.isLower l ]



capitalize'3 :: String -> String
capitalize'3 s

 =  map toUpper s


capitalizeLetters'3 :: String -> String
capitalizeLetters'3 s

 =  map toUpper (filter isLower s)      



capitalize'4 :: String -> String
capitalize'4 s

 =  map Data.Char.toUpper s

            
capitalizeLetters'4 :: String -> String
capitalizeLetters'4 s

 =  map Data.Char.toUpper (filter Data.Char.isLower s)  




