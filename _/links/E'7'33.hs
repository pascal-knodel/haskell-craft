--
--
--
-----------------
-- Exercise 7.33.
-----------------
--
--
--
module E'7'33 where



import Data.Char ( toLower , isLetter , isDigit )

import Test.QuickCheck




isPalin :: String -> Bool
isPalin string

 =      string == ""
    ||  (opaqueString /= "" && reverse opaqueString == opaqueString)
 
 where
 
 opaqueString :: String
 opaqueString =  disregard string

 disregard :: String -> String
 disregard =  toSameCase . removePunctuation
 
 removePunctuation :: String -> String
 removePunctuation [] = []
 removePunctuation ( character : remainingCharacters )
 
  |  isNotPunctuation character  = character : removePunctuation remainingCharacters
  |  otherwise                   =             removePunctuation remainingCharacters
 
 isNotPunctuation :: Char -> Bool
 isNotPunctuation character
 
  =  isLetter character || isDigit character
 
 toSameCase :: String -> String
 toSameCase [] = []
 toSameCase (character : remainingCharacters)
 
  =  (toLower character) : (toSameCase remainingCharacters)



-- Other solution for "isPalin":


isPalin' :: String -> Bool
isPalin' "" = True
isPalin' sentence

 =      stringCharacters /= ""
    &&  stringCharacters == reverse stringCharacters
 
 where
 
 stringCharacters :: String -- Upper/Lower case doesn't matter, alphabet matters:
 stringCharacters =  [ 
                            toLower  character | character <- sentence ,
 
                            isLetter character
                        ||  isDigit  character
                     ]


prop_isPalin :: String -> Bool
prop_isPalin string

 =  isPalin string == isPalin' string


-- GHCi> quickCheck prop_isPalin



{- GHCi>

isPalin ""
isPalin "A"
isPalin "Ma is as selfless as I am"
isPalin "Madam I'm Adam"
isPalin "Dammit, I'm mad!"
isPalin "121"

isPalin "AB"
isPalin "+-"

-}
-- True
-- True
-- True
-- True
-- True
-- True
--
-- False
-- False




