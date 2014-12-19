--
--
--
-----------------
-- Exercise 3.22.
-----------------
--
--
--
module E'3'22 where




numberNDroots :: Float -> Float -> Float -> Integer   -- ND; Non-Degenerate.
numberNDroots a b c

 |  b^2 > 4.0 * a * c  = 2
 |  b^2 < 4.0 * a * c  = 0
 |  otherwise          = 1   -- |  b^2 == 4.0 * a * c  = 1



{- GHCi>

--                  X^2 + 1 = 0
--  <=> 1 * X^2 + 0 * X + 1 = 0

numberNDroots ( 1 :: Float ) ( 0 :: Float ) ( 1 :: Float )

--                       X^2 = 0
--  <=>  1 * X^2 + 0 * X + 0 = 0

numberNDroots ( 1 :: Float ) ( 0 :: Float ) ( 0 :: Float )

--                        X^2 - 1 = 0
--  <=>  1 * X^2 + 0 * X + ( -1 ) = 0

numberNDroots ( 1 :: Float ) ( 0 :: Float ) ( -1 :: Float )

-}
-- 0
-- 1
-- 2




