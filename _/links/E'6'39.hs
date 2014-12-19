--
--
--
-----------------
-- Exercise 6.39.
-----------------
--
--
--
module E'6'39 where



import B'C'6 ( Price )




-- There is still an open question: How to handle negative prices? 
-- (Yes, sounds awkward, but in the current definition they are perfectly valid.)
--
-- For example: 
--
--   (-1023) `div` 100
-- = ...
-- = -11
--
-- Handling prices in computer science isn't that simple
-- People tend to get angry if the numbers aren't correct.
-- Because the author might be tricking us in a "Haskell showcase" once again, I won't spend
-- another thought on it for now. Maybe he tells us how to address this issue later.


formatPence :: Price -> String
formatPence price

 |  isNegativePrice price  = error "Negative price."
 |  otherwise              = pounds ++ "." ++ pence
 
 where
 
 pounds :: String
 pounds =  show (price `div` 100)
 
 pence :: String
 pence =  let pence = (price `mod` 100) in 
          if  (isSingleDigit pence) then ( "0" ++ (show pence) )
                                    else (         show pence  )
 
 isSingleDigit :: Int -> Bool
 isSingleDigit int
 
  |  int <  10  = True
  |  otherwise  = False
 
 isNegativePrice :: Int -> Bool
 isNegativePrice int
  
  |  int < 0    = True
  |  otherwise  = False




