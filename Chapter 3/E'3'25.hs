--
--
--
-----------------
-- Exercise 3.25.
-----------------
--
--
--
module E'3'25 where



import E'3'24 ( smallerRoot , largerRoot )




prop_smallerLargerRoot :: Float -> Float -> Float -> Bool
prop_smallerLargerRoot a b c

 =  ( smallerRoot a b c ) <= ( largerRoot a b c )

-- GHCi> quickCheck prop_smallerLargerRoot




