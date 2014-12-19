--
--
--
------------------
-- Exercise 10.28.
------------------
--
-- 
--
module E'10'28 where



-- import Prelude hiding ( getLine )




-- From chapter 7 ...


type Word = String
type Line = [Word]


-- ...




-- "getLine":
-------------


getLine' :: (a -> Int) -> Int -> [a] -> [a]
getLine' _ _   [] = []
getLine' f len ( w : ws )

 |  f w <= len =  w : restOfLine
 
 |        otherwise =  []
 
 where

 newlen      = len - ( f w + 1 )
 restOfLine  = getLine' f newlen ws



{- GHCi>

getLine' length 3 [ "1" , "3"        ]
getLine' length 3 [ "1" , "3" , "5"  ]
getLine' length 3 [ "12"             ]
getLine' length 3 [ "12", "45", "78" ]
getLine' length 3 [ "123"            ]
getLine' length 3 [ "123" , "56"     ]


-}
-- [ "1"   , "3" ]
-- [ "1"   , "3" ]
-- [ "12"        ]
-- [ "12"        ]
-- [ "123"       ]
-- [ "123"       ]




-- "dropLine":
--------------


dropLine' :: (a -> Int) -> Int -> [a] -> [a]
dropLine' _ _ [] = []
dropLine' f lineLength wordList@(wordFromList : remainingWordsInList)   -- "wordList" is an alias for "(wordFromList : remainingWordsInList)".

 |  lineLength >= f wordFromList =  restOfWordList   -- Based on the behaviour of "getLine" (see its definition).
 
 |                     otherwise =  wordList
 
 where
 
 remainingLineLength :: Int
 remainingLineLength =  lineLength - (f wordFromList + 1)   -- 1 is the inter-word space.
 
 restOfWordList =  dropLine' f remainingLineLength remainingWordsInList




-- "splitLine":
---------------


splitLines ::    Int
              -> ( Int -> [a] -> ( [a] , [a] ) )
              -> [a]
              -> [[a]]


splitLines _          _             [] =  []
splitLines lineLength splitFunction strings

 =  line : splitLines lineLength splitFunction rest
 
 where
 
 (line , rest) = splitFunction lineLength strings


{- GHCi>

:{

   let splitFunction :: Int -> [[a]] -> ( [[a]] , [[a]] ) ;
       splitFunction lineLength list

        =  ( getLine' length lineLength list , dropLine' length lineLength list )

:}


splitLines 3 splitFunction [ "1" , "3" , "5" , "7" , "9" ]

-}
-- [  [ "1" , "3" ] , [ "5" , "7" ] , [ "9" ]  ]




