--
--
--
------------------
-- Exercise 11.20.
------------------
--
--
--
module E'11'20 where



import B'C'11
 (
   iter
 , succ
 )

import Prelude hiding (succ)




-- Type:
--------


{- GHCi>

:t iter
:t succ

-}
-- iter :: Integer -> (a -> a) -> a -> a
-- succ :: Integer -> Integer


--           iter               :: Integer -> (a -> a) -> a -> a
--                                                                 | applying "n", cancelling first "Integer"
--    <=>   (iter n)            :: (a -> a) -> a -> a
--                                                                 | applying "succ", instancing "a" with "Integer", cancelling "Integer -> Integer"
--    <=>   (iter n succ)       :: Integer -> Integer
--                                                                 | partial anonymous function, inserting "Integer" at the left
--    <=>   (\n -> iter n succ) :: Integer -> Integer -> Integer


{- GHCi>

:t (\n -> iter n succ)

-}
-- (\n -> iter n succ) :: Integer -> Integer -> Integer



-- Effect:
----------


-- "\n -> iter n succ" puts the "Integer" argument "n" at the first place
-- and applies iter to this argument and another function "succ" which becomes 'hard-defined'.
-- "\n -> iter n succ" is a specialization of "iter". If "n" is greater zero, the result is a
-- function that applies "succ" "n" times to an integer input. Otherwise, if "n" is lesser than
-- zero, the result is a function, that just returns the integer input
-- (like a special "id" function).


-- GHCi> (\n -> iter n succ) 0 0
-- 0

-- GHCi> (\n -> iter n succ) 1 0
-- 1

-- GHCi> (\n -> iter n succ) 2 0
-- 2


-- GHCi> (\n -> iter n succ) (-1) 0
-- 0

-- GHCi> (\n -> iter n succ) (-1) 1
-- 1

-- GHCi> (\n -> iter n succ) (-1) 2
-- 2




