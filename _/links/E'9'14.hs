--
--
--
-----------------
-- Exercise 9.14.
-----------------
--
--
--
module E'9'14 where



import E'9'12 ( rev )

import Test.QuickCheck




prop_ReverseRev :: [Integer] -> Bool
prop_ReverseRev list

 =  reverse list == rev list

-- GHCi> quickCheck prop_ReverseRev


-- Note: Works for QuickCheck testing, but can't be used 'directly' for proving.




