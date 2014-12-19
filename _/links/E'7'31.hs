--
--
--
-----------------
-- Exercise 7.31.
-----------------
--
--
--
module E'7'31 where



import E'7'27 ( Line )
import E'7'28 ( joinLine )




joinAndJustifyLine :: Line -> Int -> String
joinAndJustifyLine line maximumLineLength

 |  length line == 1  = line !! 1 -- Only one word.
 |  otherwise         = justify lineAsString
 
 where
 
 lineAsString :: String
 lineAsString =  joinLine line

 -- Cyclic insertion of blanks between the words (consecutive occurrences of non-white-space characters) 
 -- from left to right while the maximum line-length isn't reached:

 justify :: String -> String
 justify [] = []
 justify string

  |  length string < maximumLineLength  = justify (insertBlanks string (maximumLineLength - length string))
  |  otherwise                          = string
  
 insertBlanks :: String -> Int -> String
 insertBlanks [] _ = []
 insertBlanks ( character : remainingCharacters ) number
 
  |  number < 1        =        character : insertBlanks remainingCharacters  number
  |  character == ' '  =  ' ' : character : insertBlanks remainingCharacters (number - 1)
  |  otherwise         =        character : insertBlanks remainingCharacters  number


{- GHCi>

let line = ["carnival", "season", "kicked", "into", "gear"]

joinAndJustifyLine line 34

-}
-- "carnival  season  kicked into gear"



-- Another approach that should work:
-- Pre-calculation of the number of blanks between two words.




