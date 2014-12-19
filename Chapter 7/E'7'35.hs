--
--
--
-----------------
-- Exercise 7.35.
-----------------
--
--
--
module E'7'35 where



import E'7'34 ( subst )
import E'7'25 ( isSubsequence )

import Test.QuickCheck
import QCC ( quickCheckN )




prop_resubst :: String -> String -> String -> Property
prop_resubst oldSubstring newSubstring string

 =           oldSubstring /= []
         &&  newSubstring /= []
         &&  oldSubstring `isSubsequence` string
       
    ==>  string == resubstitution
 
 where
 
 substitution :: String
 substitution =  subst oldSubstring newSubstring string
 
 resubstitution :: String
 resubstitution =  subst newSubstring oldSubstring substitution


-- GHCi> quickCheckN 10000 prop_resubst
-- *** Gave up! Passed only 213 tests.



prop_substSelf :: String -> Bool
prop_substSelf string

 =  subst string string string == string



{- GHCi>

quickCheck prop_substSelf
quickCheckN 10000 prop_resubst

-}




