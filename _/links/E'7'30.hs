--
--
--
-----------------
-- Exercise 7.30.
-----------------
--
--
--
module E'7'30 where



import Prelude hiding ( getLine )

import E'7'27 ( Line , Word , getLine , dropLine )

import GHC.List ( elem , splitAt )
import Data.List.Split ( splitOneOf )

import Test.QuickCheck




-- Note: there is a problem with the Craft3e-0.1.0.10 release,
--       it occurs if a word is longer than "lineLength":

{- GHCi>

-- Craft3e-0.1.0.10:
-- lineLength < 100 (?)

let words = [   ['-'| _<- [ 1 .. 100 ] ]   ]
splitLines words

-}
-- 'endless loop of [[] ..]'



-- Subchapter 7.6 (relevant definitions of it):


whitespace :: [Char]
whitespace =  ['\n', '\t', ' ']


lineLength :: Int
lineLength =  30


dropSpace :: String -> String
dropSpace [] = []
dropSpace string@( character : remainingCharacters )

 |  character `elem` whitespace  = dropSpace remainingCharacters
 |  otherwise                    = string


getWord :: String -> String
getWord [] = []
getWord ( character : remainingCharacters )

 |  character `elem` whitespace  = []
 |  otherwise                    = character : getWord remainingCharacters


dropWord :: String -> String
dropWord [] = []
dropWord string@( character : remainingCharacters )

 |  character `elem` whitespace  = string
 |  otherwise                    = dropWord remainingCharacters


splitWords :: String -> [Word]
splitWords string

 =  split (dropSpace string)


split :: String -> [Word]
split [] = []
split string

 =  (getWord string) : split ( dropSpace (dropWord string) )


splitLines :: [Word] -> [Line]
splitLines [] = []
splitLines words

 =  (getLine lineLength words) : splitLines (dropLine lineLength words)


-- ...



-- http://hackage.haskell.org/package/split
-- http://www.haskell.org/hoogle/?hoogle=String+-%3E+[String]



-- Note: There is a function "words" in the Prelude library.
--       Besides the different set of white space characters
--       this is the standard function to go with.


splitWords' :: String -> [Word]
splitWords' string

 =  notEmptyWords
 
 where
 
 words :: [Word]
 words =  splitOneOf whitespace string
 
 notEmptyWords :: [Word]
 notEmptyWords =  [ word | word <- words, word /= "" ]


prop_splitWords :: String -> Bool
prop_splitWords string

 =  splitWords string == splitWords' string


-- GHCi> quickCheck prop_splitWords


splitAfter =  splitAt -- Just aliasing / another name for the same function.


splitIntoLines :: [String] -> [[String]]
splitIntoLines [] = []
splitIntoLines words 

 =  line : splitIntoLines remainingWords
 
 where
 
 ( line , remainingWords ) =  splitAfter lastWordInLine words :: ( Line , [Word] )
 
 lastWordInLine :: Int
 lastWordInLine =  countWordsForLine words lineLength
 
 countWordsForLine :: [String] -> Int -> Int
 countWordsForLine words maximumLineLength =  countWordsForLine' words maximumLineLength 0
 
 countWordsForLine' :: [String] -> Int -> Int -> Int
 countWordsForLine' [] _ _ = 0
 countWordsForLine' ( word : remainingWords ) maximumLineLength currentLineLength -- Accumulates line-lengths in the third argument to "countWordsForLine'".
 
  |  (currentLineLength + length word) <= maximumLineLength  = 1 + countWordsForLine' remainingWords maximumLineLength (currentLineLength + length word + 1)
  |  otherwise                                               = 0


{- GHCi> 

lineLength

let words = [ "123456789" | _ <- [1 .. 10] ]

splitIntoLines []
splitIntoLines words

-}
-- 30
-- []
--
-- [ 
--   [ "123456789" , "123456789" , "123456789" ] ,
--   [ "123456789" , "123456789" , "123456789" ] ,
--   [ "123456789" , "123456789" , "123456789" ] ,
--	 [ "123456789" ] 
-- ]



prop_splitLines :: [Word] -> Property
prop_splitLines words

 =       [] == [ word | word <- words, length word > lineLength ]
 -- If no word is longer than the maximum line length then:
    ==>  splitLines words == splitIntoLines words


-- GHCi> quickCheck prop_splitLines



{- GHCi>

quickCheck prop_splitWords
quickCheck prop_splitLines

-}




