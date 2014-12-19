--
--
--
-----------------
-- Exercise 7.32.
-----------------
--
--
--
module E'7'32 where



import E'7'27 ( Line , Word )
import E'7'30 ( splitLines , splitWords )

import GHC.List ( concat )




wc :: String -> (Int , Int , Int) -- Number of characters, words and lines (wc; word count).
wc text

 =  ( characterCount , wordCount , lineCount )
 
 where
 
 wordCount :: Int
 wordCount =  length words 
 
 characterCount :: Int
 characterCount =  countCharacters words

 lineCount :: Int
 lineCount =  length lines
 
 words :: [Word]
 words =  splitWords text
 
 countCharacters :: [Word] -> Int
 countCharacters [] = 0
 countCharacters ( word : remainingWords ) =  length word + countCharacters remainingWords
 
 lines :: [Line]
 lines =  splitLines words
 

{- GHCi>

wc ""
wc "ab\n"
wc "a b\n"

-}
-- (0 , 0 , 0)
-- (2 , 1 , 1)
-- (2 , 2 , 1)



-- Subchapter 7.6 (relevant definitions of it):


fill :: String -> [Line]
fill =  splitLines . splitWords


-- ...



wcFormat :: String -> (Int , Int , Int) -- wc; word count
wcFormat text

 =  ( characterCount , wordCount , lineCount )
 
 where
 
 lines :: [Line]
 lines =  fill text -- Exercise.
 
 lineCount :: Int
 lineCount =  length lines
 
 wordCount :: Int
 wordCount =  length words
 
 words :: [Word]
 words =  concat lines

 characterCount :: Int
 characterCount =  countCharacters words

 countCharacters :: [Word] -> Int
 countCharacters [] = 0
 countCharacters ( word : remainingWords ) =  length word + countCharacters remainingWords


{- GHCi>

wcFormat ""
wcFormat "ab\n"
wcFormat "a b\n"

-}
-- (0 , 0 , 0)
-- (2 , 1 , 1)
-- (2 , 2 , 1)




