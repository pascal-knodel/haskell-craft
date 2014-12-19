--
--
--
------------------
-- Exercise 10.24.
------------------
--
-- 
--
module E'10'24 where




-- From chapter 7 ...


whitespace :: String
whitespace = [ '\n' , '\t' , ' ' ]


dropWord' :: String -> String
dropWord' []    = []
dropWord' ( x : xs ) 
 
 |  elem x whitespace =  ( x : xs )

 |          otherwise =  dropWord' xs


-- ...



dropUntil :: (a -> Bool) -> [a] -> [a]
dropUntil _ [] = []
dropUntil p ( x : xs )

 |        p x =  ( x : xs )
 
 |  otherwise =  dropUntil p xs


isWhitespace :: Char -> Bool
isWhitespace character =  character `elem` whitespace


dropWord :: String -> String
dropWord string =  dropUntil isWhitespace string


{- GHCi>

dropWord ""
dropWord "word1"
dropWord "word1 word2"

-}
-- ""
-- ""
-- " word2"




