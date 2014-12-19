--
--
--
-----------------
-- Exercise 11.7.
-----------------
--
--
--
module E'11''7 where



isNonWhitespace

    -- Lambda abstraction:

 =  \character -> not $ character `elem` whitespace
 
    -- ...
 
 where
 
 whitespace :: [Char]
 whitespace =  " \t\n"


{- GHCi>

isNonWhitespace 'a'
isNonWhitespace ' '

-}
-- True
-- False




