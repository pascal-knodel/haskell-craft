--
--
--
-----------------
-- Exercise 3.16.
-----------------
--
--
--
module E'3'16 where




upperLowerCaseOffset :: Int
upperLowerCaseOffset

 =  ( fromEnum 'a' ) - ( fromEnum 'A' )



isLower :: Char -> Bool
isLower aChar

 |      aChar >= 'a'
    &&  aChar <= 'z'  = True
    
 |  otherwise         = False



toUpper :: Char -> Char
toUpper aChar

 |  isLower aChar  = toEnum ( ( fromEnum aChar ) - upperLowerCaseOffset )
 |  otherwise      = aChar




{- GHCi>

toUpper '1'
toUpper 'a'

-}
-- '1'
-- 'A'




