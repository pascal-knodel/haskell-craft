--
--
--
------------------
-- Exercise 10.25.
------------------
--
-- 
--
module E'10'25 where



import Prelude hiding ( takeWhile )

import E'10'24 ( dropUntil )




-- "dropSpace":
---------------


-- From chapter 7 ...


whitespace :: String
whitespace = [ '\n' , '\t' , ' ' ]


dropSpace' :: String -> String
dropSpace' [] = []
dropSpace' ( x : xs )

  |  elem x whitespace = dropSpace' xs
  
  |          otherwise = ( x : xs )


-- ...



isNoWhitespace :: Char -> Bool
isNoWhitespace character

 =  not ( character `elem` whitespace )


dropSpace :: String -> String
dropSpace string

 =  dropUntil isNoWhitespace string


{- GHCi>

dropSpace ""
dropSpace " "
dropSpace "  "

-}
-- ""
-- ""
-- ""




-- "takeWhile":
---------------


-- From chapter 10 ...


takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []
takeWhile' p ( x : xs )

 |        p x =  x : takeWhile' p xs
 
 |  otherwise = []


getUntil :: (a -> Bool) -> [a] -> [a]
getUntil _ [] = [] 
getUntil p ( x : xs )

  |        p x =  []
  
  |  otherwise =  x : getUntil p xs


-- ...


takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile p xs

 =  getUntil notP xs
 
 where
 
 notP x = not ( p x )

 
{- GHCi>

let getWord string = takeWhile isNoWhitespace string

getWord ""
getWord "word1"
getWord "word1 word2"

-}
-- ""
-- "word1"
-- "word1"




