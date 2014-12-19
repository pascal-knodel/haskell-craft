--
--
--
-----------------
-- Exercise 7.28.
-----------------
--
--
--
module E'7'28 where



import E'7'27 ( Line )

import Data.List ( intercalate )

import Test.QuickCheck




-- Subchapter 7.6 (relevant definitions of it): ex. 7.27


-- http://www.haskell.org/hoogle/?hoogle=a+-%3E+[[a]]+-%3E+[a]


joinLine :: Line -> String
joinLine line

 =  blank `intercalate` line
 
 where
 
 blank :: String
 blank =  " "


-- GHCi> joinLine [ "12", "456", "89" ]
-- "12 456 89"



-- Other solution for "joinLine":


joinLine' :: Line -> String
joinLine' [] = ""
joinLine' [ word ] = word
joinLine' ( word : remainingWords )

 =  word ++ " " ++ (joinLine' remainingWords)


 
prop_joinLine :: Line -> Bool
prop_joinLine line

 =  joinLine line == joinLine' line


-- GHCi> quickCheck prop_joinLine




