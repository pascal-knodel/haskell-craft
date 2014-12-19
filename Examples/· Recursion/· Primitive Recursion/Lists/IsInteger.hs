-- Checks if a string is an integer of the regular expression (*, +) format in parenthesis: ((-)*(0123456789)+).
module IsInteger where



isInteger :: String -> Bool
isInteger [] = False
isInteger potentialInteger@(potentialSign : potentialRemainingDigits)
 
 | potentialSign == '-' = isInteger' potentialRemainingDigits
 | otherwise            = isInteger' potentialInteger
 
 where
 
 isInteger' :: String -> Bool
 isInteger' [] = True
 isInteger' (potentialDigit : remainingPotentialDigits)
 
  = (potentialDigit `elem` "0123456789") && (isInteger' remainingPotentialDigits)



{- GHCi>


isInteger "-1"
isInteger "0"
isInteger "00"

isInteger ""
isInteger "+1"
isInteger "A"


-}
-- True
-- True
-- True
--
-- False
-- False
-- False


