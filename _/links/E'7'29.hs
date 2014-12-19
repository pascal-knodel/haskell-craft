--
--
--
-----------------
-- Exercise 7.29.
-----------------
--
--
--
module E'7'29 where



import E'7'27 ( Line )
import E'7'28 ( joinLine )

import Data.List ( intercalate )

import Test.QuickCheck




-- Subchapter 7.6 (relevant definitions of it): ex. 7.27


-- Using the function "joinLine" from ex. 7.28:

joinLines :: [Line] -> String
joinLines [] = ""
joinLines [ line ] = joinLine line
joinLines ( line : remainingLines )

 =  (joinLine line) ++ "\n" ++ (joinLines remainingLines)


-- Using "intercalate" from the Data.List library:

joinLines' :: [Line] -> String
joinLines' lines

 =  "\n" `intercalate` (map joinLine lines)


prop_joinLines :: [Line] -> Bool
prop_joinLines lines

 =  joinLines lines == joinLines' lines


-- GHCi> quickCheck prop_joinLines




