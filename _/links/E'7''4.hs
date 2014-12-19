--
--
--
----------------
-- Exercise 7.4.
----------------
--
--
--
module E'7''4 where



import Data.Char ( isDigit )




-- Subchapter 5.6 (exercise relevant definitions):


digits :: String -> String 
digits string =  [ char | char <- string, isDigit char ] 


firstDigit :: String -> Char
firstDigit string

 =  case (digits string) of
 
    []            -> '\0'
    ( first : _ ) -> first


-- ...



firstDigit' :: String -> Char
firstDigit' string
 
 |  stringDigits == []  = '\0'
 |  otherwise           = stringDigits !! firstDigitIndex
 
 where
 
 stringDigits :: String
 stringDigits =  digits string
 
 firstDigitIndex :: Int
 firstDigitIndex =  0


{- GHCi>

let empty        :: String ; empty        = ""
let alpha        :: String ; alpha        = "a"
let numeric      :: String ; numeric      = "1"
let alphaNumeric :: String ; alphaNumeric = "a1"

firstDigit empty
firstDigit alpha
firstDigit numeric
firstDigit alphaNumeric

-}
-- '\NUL'
-- '\NUL'
-- '1'
-- '1'




