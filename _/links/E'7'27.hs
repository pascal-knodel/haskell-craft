--
--
--
-----------------
-- Exercise 7.27.
-----------------
--
--
--
module E'7'27 where



import Prelude hiding ( getLine )
-- Subchapter 7.6 (relevant definitions of it):


type Word =  String

type Line =  [Word]


getLine :: Int -> [Word] -> Line -- Use "import Prelude hiding (getLine)" to avoid an ambiguous occurrence exception with Prelude imports.
getLine lineLength [] = []
getLine lineLength ( wordFromList : remainingWordsInList )

 |  wordFromListLength <= lineLength  = wordFromList : restOfLine
 |  otherwise                         = []
 
 where
 
 wordFromListLength :: Int
 wordFromListLength =  length wordFromList
 
 remainingLineLength :: Int
 remainingLineLength =  lineLength - (wordFromListLength + 1) -- 1 is the inter-word space.
 
 restOfLine :: Line
 restOfLine =  getLine remainingLineLength remainingWordsInList


-- ...



dropLine :: Int -> [Word] -> Line
dropLine _ [] = []
dropLine lineLength wordList@( wordFromList : remainingWordsInList ) -- "wordList" is an alias for "(wordFromList : remainingWordsInList)".

 |  lineLength >= wordFromListLength  = restOfWordList -- Based on the behaviour of "getLine" (see definition of it).
 |  otherwise                         = wordList
 
 where
 
 wordFromListLength :: Int
 wordFromListLength =  length wordFromList
 
 remainingLineLength :: Int
 remainingLineLength =  lineLength - (wordFromListLength + 1) -- 1 is the inter-word space.
 
 restOfWordList :: [Word]
 restOfWordList =  dropLine remainingLineLength remainingWordsInList



{- GHCi>

let line :: [Word] ; line = ["12", "456", "89"]

dropLine 0 line
dropLine 1 line
dropLine 2 line
dropLine 3 line
dropLine 4 line
dropLine 5 line
dropLine 6 line

-}
-- [ "12" , "456" , "89" ]
-- [ "12" , "456" , "89" ]
-- [ "456" , "89" ]
-- [ "456" , "89" ]
-- [ "456" , "89" ]




