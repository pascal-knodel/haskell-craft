--
--
--
-----------------
-- Exercise 6.15.
-----------------
--
--
--
module E'6'15 where



import Pictures
 (
   Picture
 , invertColour
 )

import Test.QuickCheck




prop_invertColour :: Picture -> Bool
prop_invertColour a

 =  ( invertColour (invertColour a) ) == a

-- GHCi> quickCheck prop_invertColour


-- No, it  won't hold: Other characters than "." and "#" will change to ".", which transforms to "#" 
-- and not back to the "other" character. The ==>-mechanism isn't a good choice for this property 
-- - we need something else.


-- GHCi> quickCheck prop_invertColour
-- *** Failed! Falsifiable (after 3 tests and 3 shrinks):
-- ["a"]

-- GHCi> invertColour ["a"]
-- ["."]

-- GHCi> invertColour (invertColour ["a"])
-- ["#"]



prop_invertColour' :: Picture -> Property
prop_invertColour' a

 =       isDotOrHashCharsOnly
    ==>  ( invertColour (invertColour a) ) == a
   
 where
 
 notDotOrHashChars :: String
 notDotOrHashChars
 
  =  [ char | row <- a, char <- row , char /= '.' && char /= '#' ]
  
 isDotOrHashCharsOnly :: Bool
 isDotOrHashCharsOnly
 
  =  notDotOrHashChars == []

-- GHCi> quickCheck prop_invertColour'




