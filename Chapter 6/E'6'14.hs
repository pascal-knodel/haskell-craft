--
--
--
-----------------
-- Exercise 6.14.
-----------------
--
--
--
module E'6'14 where



import E'6''8 ( rotate90 )

import Pictures
 (
   Picture
 , rectangular
 , rotate
 )

import Test.QuickCheck




prop_rotate90 :: Picture -> Property
prop_rotate90 a

 =       (      ( not ("" `Prelude.elem` a) )   -- ["", ..., ""] causes problems with transpose.
            &&  rectangular a         			)
			
    ==>  ( (rotate90 . rotate90 . rotate90 . rotate90) a ) == a

-- GHCi> quickCheck prop_rotate90


prop_rotate90_rotate :: Picture -> Property
prop_rotate90_rotate a

 =           ( not ("" `Prelude.elem` a) )   -- ["", ..., ""] causes problems with transpose (example: transpose [""] == []).
         &&  rectangular a
		 
    ==>  ( (rotate90 . rotate90) a ) == (rotate a)

-- GHCi> quickCheck prop_rotate90_rotate




