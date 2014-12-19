--
--
--
-----------------
-- Exercise 3.17.
-----------------
--
--
--
module E'3'17 where




isDigit :: Char -> Bool
isDigit aChar

 |      aChar >= '0'
    &&  aChar <= '9'  = True

 | otherwise          = False



charToNum :: Char -> Int
charToNum aChar

 |  isDigit aChar  = ( fromEnum aChar ) - ( fromEnum '0' )
 |  otherwise      = 0



{- GHCi>

charToNum '1'
charToNum 'A'

-}
-- 1
-- 0




