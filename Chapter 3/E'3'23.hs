--
--
--
-----------------
-- Exercise 3.23.
-----------------
--
--
--
module E'3'23 where



import E'3'22 ( numberNDroots )




numberRoots :: Float -> Float -> Float -> Integer
numberRoots a b c

 |  a /= 0.0                = numberNDroots a b c
 |  b /= 0.0                = 1
 |  b == 0.0  &&  c /= 0.0  = 0
 |  otherwise               = 3    -- |  b == 0.0  &&  c == 0.0  = 3



{- GHCi>

--                  X^2 + 1 = 0
--  <=> 1 * X^2 + 0 * X + 1 = 0

numberRoots ( 1 :: Float ) ( 0 :: Float ) ( 1 :: Float )

--                       X^2 = 0
--  <=>  1 * X^2 + 0 * X + 0 = 0

numberRoots ( 1 :: Float ) ( 0 :: Float ) ( 0 :: Float )

--                        X^2 - 1 = 0
--  <=>  1 * X^2 + 0 * X + ( -1 ) = 0

numberRoots ( 1 :: Float ) ( 0 :: Float ) ( -1 :: Float )

--                         0 = 0
--  <=>  0 * X^2 + 0 * X + 0 = 0

numberRoots ( 0 :: Float ) ( 0 :: Float ) ( 0 :: Float )

-}
-- 0
-- 1 
-- 2
-- 3




