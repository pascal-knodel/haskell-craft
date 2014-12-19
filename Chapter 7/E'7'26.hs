--
--
--
-----------------
-- Exercise 7.26.
-----------------
--
--
--
module E'7'26 where



import E'7'25
 ( 
   isSublist
 , isSublist'
 , isSubsequence
 , isSubsequence'
 )

import Data.List ( isInfixOf )

import Test.QuickCheck




-- QuickCheck tests for "isSublist" (ex. 7.25):


prop_isSublist :: String -> String -> Bool
prop_isSublist potentialSublist list

 =  isSublist potentialSublist list == isSublist' potentialSublist list


 
-- QuickCheck tests for "isSubsequnce" (ex. 7.25):


prop_isSubsequence :: String -> String -> Bool
prop_isSubsequence potentialSubstring string

 =  Data.List.isInfixOf potentialSubstring string == isSubsequence potentialSubstring string


prop_isSubsequence' :: String -> String -> Bool
prop_isSubsequence' potentialSubstring string

 =  isSubsequence potentialSubstring string == isSubsequence' potentialSubstring string



{- GHCi>

quickCheck prop_isSublist
quickCheck prop_isSubsequence
quickCheck prop_isSubsequence'

-}




