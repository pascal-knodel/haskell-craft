--
--
--
-----------------
-- Exercise 6.25.
-----------------
--
--
--
module E'6'25 where



import E'6'19
 (
   Picture'B
 , flipH'B
 , flipV'B
 , horse'B
 , beside'B
 , above'B
 , height'B
 )
import E'6'20
 (
   flipH'C
 , flipV'C
 , horse'C
 , beside'C
 , above'C
 , height'C
 )
import E'6'22
 (
   Picture'S
 , flipH'S
 , flipV'S
 , horse'S
 , beside'S
 , above'S
 , height'S
 )
import E'6'23
 (
   Picture'R
 , flipH'R
 , flipV'R
 , horse'R
 , beside'R
 , above'R
 , height'R
 )

import Pictures ( Picture )

import Test.QuickCheck




-- Exercise 6.19 ([[Bool]]):


prop_rotate'B, prop_flipV'B, prop_flipH'B :: Picture'B -> Bool   -- Pictures.hs

prop_rotate'B picture =  flipV'B (flipH'B picture) == flipH'B (flipV'B picture)
prop_flipV'B picture  =  flipV'B (flipV'B picture) == picture
prop_flipH'B picture  =  flipH'B (flipH'B picture) == picture


test_rotate'B, test_flipV'B, test_flipH'B :: Bool   -- Pictures.hs

test_rotate'B = flipV'B (flipH'B horse'B) == flipH'B (flipV'B horse'B)
test_flipV'B  = flipV'B (flipV'B horse'B) == horse'B
test_flipH'B  = flipH'B (flipH'B horse'B) == horse'B


prop_AboveBeside'B :: Picture'B -> Bool   -- 6.13
prop_AboveBeside'B a

 =  (putAbove `beside'B` putAbove) == (putBeside `above'B` putBeside)
 
 where
 
 putAbove :: Picture'B
 putAbove =  a `above'B` a

 putBeside :: Picture'B
 putBeside =  a `beside'B` a


prop_BesideFlipH'B :: Picture'B -> Picture'B -> Property   -- 6.12
prop_BesideFlipH'B a b

 =       (height'B a) == (height'B b)
    ==>  flipH'B (a `beside'B` b) == (flipH'B a) `beside'B` (flipH'B b)


prop_BesideFlipV'B :: Picture'B -> Picture'B -> Bool   -- 6.12
prop_BesideFlipV'B a b = flipV'B (a `beside'B` b) == (flipV'B b) `beside'B` (flipV'B a)


{- GHCi>

quickCheck prop_rotate'B
quickCheck prop_flipV'B
quickCheck prop_flipH'B
--
quickCheck test_rotate'B
quickCheck test_flipV'B
quickCheck test_flipH'B
--
quickCheck prop_AboveBeside'B
--
quickCheck prop_BesideFlipH'B
--
quickCheck prop_BesideFlipV'B

-}



-- Exercise 6.19 ("list of columns"):


prop_rotate'C, prop_flipV'C, prop_flipH'C :: Picture -> Bool   -- Pictures.hs

prop_rotate'C picture =  flipV'C (flipH'C picture) == flipH'C (flipV'C picture)
prop_flipV'C picture  =  flipV'C (flipV'C picture) == picture
prop_flipH'C picture  =  flipH'C (flipH'C picture) == picture


test_rotate'C, test_flipV'C, test_flipH'C :: Bool   -- Pictures.hs

test_rotate'C =  flipV'C (flipH'C horse'C) == flipH'C (flipV'C horse'C)
test_flipV'C  =  flipV'C (flipV'C horse'C) == horse'C
test_flipH'C  =  flipH'C (flipH'C horse'C) == horse'C


prop_AboveBeside'C :: Picture -> Bool -- 6.13
prop_AboveBeside'C a

 = (putAbove `beside'C` putAbove) == (putBeside `above'C` putBeside)

 where
 
 putAbove :: Picture
 putAbove =   a `above'C` a

 putBeside :: Picture
 putBeside =  a `beside'C` a

 
prop_BesideFlipH'C :: Picture -> Picture -> Property -- 6.12
prop_BesideFlipH'C a b

 =       (height'C a) == (height'C b)
    ==>  flipH'C (a `beside'C` b) == (flipH'C a) `beside'C` (flipH'C b)


prop_BesideFlipV'C :: Picture -> Picture -> Bool -- 6.12
prop_BesideFlipV'C a b = flipV'C (a `beside'C` b) == (flipV'C b) `beside'C` (flipV'C a)


{- GHCi>

quickCheck prop_rotate'C
quickCheck prop_flipV'C
quickCheck prop_flipH'C
--
quickCheck test_rotate'C
quickCheck test_flipV'C
quickCheck test_flipH'C
--
quickCheck prop_AboveBeside'C
--
quickCheck prop_BesideFlipH'C
--
quickCheck prop_BesideFlipV'C

-}



-- Exercise 6.22 (String):


prop_rotate'S :: Picture'S -> Bool   -- Pictures.hs
prop_rotate'S picture =  flipV'S (flipH'S picture) == flipH'S (flipV'S picture)

prop_flipV'S :: Picture'S -> Property   -- Pictures.hs
prop_flipV'S picture

 =       (picture /= [] && last picture == '\n')
    ==>  flipV'S (flipV'S picture) == picture


prop_flipH'S :: Picture'S -> Property   -- Pictures.hs
prop_flipH'S picture

 =       (picture /= [] && last picture == '\n')
    ==>  flipH'S (flipH'S picture) == picture


test_rotate'S, test_flipV'S, test_flipH'S :: Bool   -- Pictures.hs

test_rotate'S =  flipV'S (flipH'S horse'S) == flipH'S (flipV'S horse'S)
test_flipV'S  =  flipV'S (flipV'S horse'S) == horse'S
test_flipH'S  =  flipH'S (flipH'S horse'S) == horse'S


prop_AboveBeside'S :: Picture'S -> Property   -- 6.13
prop_AboveBeside'S a

 =       a /= []  &&  last a == '\n'
    ==>  (putAbove `beside'S` putAbove) == (putBeside `above'S` putBeside)

 where
 
 putAbove :: Picture'S
 putAbove =  a `above'S` a

 putBeside :: Picture'S
 putBeside =  a `beside'S` a

 
prop_BesideFlipH'S :: Picture'S -> Picture'S -> Property   -- 6.12
prop_BesideFlipH'S a b

 =           (height'S a) == (height'S b)
         &&  a /= []
         &&  last a == '\n'
    ==>      flipH'S (a `beside'S` b) == (flipH'S a) `beside'S` (flipH'S b)


prop_BesideFlipV'S :: Picture'S -> Picture'S -> Property   -- 6.12
prop_BesideFlipV'S a b

 =           a /= []
         &&  last a == '\n'
    ==>      flipV'S (a `beside'S` b) == (flipV'S b) `beside'S` (flipV'S a)


{- GHCi>

quickCheck prop_rotate'S
quickCheck prop_flipV'S
quickCheck prop_flipH'S
--
quickCheck test_rotate'S
quickCheck test_flipV'S
quickCheck test_flipH'S
--
quickCheck prop_AboveBeside'S
--
quickCheck prop_BesideFlipH'S
--
quickCheck prop_BesideFlipV'S

-}



-- Exercise 6.19 (run-length encoding):


prop_rotate'R, prop_flipV'R, prop_flipH'R :: Picture'R -> Bool   -- Pictures.hs

prop_rotate'R picture =  flipV'R (flipH'R picture) == flipH'R (flipV'R picture)
prop_flipV'R picture  =  flipV'R (flipV'R picture) == picture
prop_flipH'R picture  =  flipH'R (flipH'R picture) == picture


test_rotate'R, test_flipV'R, test_flipH'R :: Bool   -- Pictures.hs

test_rotate'R =  flipV'R (flipH'R horse'R) == flipH'R (flipV'R horse'R)
test_flipV'R  =  flipV'R (flipV'R horse'R) == horse'R
test_flipH'R  =  flipH'R (flipH'R horse'R) == horse'R


prop_AboveBeside'R :: Picture'R -> Bool   -- 6.13
prop_AboveBeside'R a

 =  (putAbove `beside'R` putAbove) == (putBeside `above'R` putBeside)

 where
 
 putAbove :: Picture'R
 putAbove =  a `above'R` a

 putBeside :: Picture'R
 putBeside =  a `beside'R` a

 
prop_BesideFlipH'R :: Picture'R -> Picture'R -> Property   -- 6.12
prop_BesideFlipH'R a b

 =       (height'R a) == (height'R b)
    ==>  flipH'R (a `beside'R` b) == (flipH'R a) `beside'R` (flipH'R b)


prop_BesideFlipV'R :: Picture'R -> Picture'R -> Bool   -- 6.12
prop_BesideFlipV'R a b

 =  flipV'R (a `beside'R` b) == (flipV'R b) `beside'R` (flipV'R a)


{- GHCi>

quickCheck prop_rotate'R
quickCheck prop_flipV'R
quickCheck prop_flipH'R
--
quickCheck test_rotate'R
quickCheck test_flipV'R
quickCheck test_flipH'R
--
quickCheck prop_AboveBeside'R
--
quickCheck prop_BesideFlipH'R
--
quickCheck prop_BesideFlipV'R

-}


-- Changes I had to implement:
--
-- Renaming.
-- Quick check pre conditions.
-- ...
--




