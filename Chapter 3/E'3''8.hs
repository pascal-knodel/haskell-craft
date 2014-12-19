--
--
--
----------------
-- Exercise 3.8.
----------------
--
--
--
module E'3''8 where




mystery :: Integer -> Integer -> Integer -> Bool
mystery a b c

 = not ( a == b && b == c )

-- Returns True if at least one out of three integers is different.


integerNE = mystery   -- NE; Not Equal




{- GHCi>

mystery 0 0 0
mystery 0 0 1
mystery 0 0 2
mystery 0 1 0
mystery 0 1 1
mystery 0 1 2
mystery 0 2 0
mystery 0 2 1
mystery 0 2 2
mystery 1 0 0
mystery 1 0 1
mystery 1 0 2
mystery 1 1 0
mystery 1 1 1
mystery 1 1 2
mystery 1 2 0
mystery 1 2 1
mystery 1 2 2
mystery 2 0 0
mystery 2 0 1
mystery 2 0 2
mystery 2 1 0
mystery 2 1 1
mystery 2 1 2
mystery 2 2 0
mystery 2 2 1
mystery 2 2 2

-}
-- mystery 0 0 0   -- False
-- mystery 0 0 1   -- True
-- mystery 0 0 2   -- True
-- mystery 0 1 0   -- True
-- mystery 0 1 1   -- True
-- mystery 0 1 2   -- True
-- mystery 0 2 0   -- True
-- mystery 0 2 1   -- True
-- mystery 0 2 2   -- True
-- mystery 1 0 0   -- True
-- mystery 1 0 1   -- True
-- mystery 1 0 2   -- True
-- mystery 1 1 0   -- True
-- mystery 1 1 1   -- False
-- mystery 1 1 2   -- True
-- mystery 1 2 0   -- True
-- mystery 1 2 1   -- True
-- mystery 1 2 2   -- True
-- mystery 2 0 0   -- True
-- mystery 2 0 1   -- True
-- mystery 2 0 2   -- True
-- mystery 2 1 0   -- True
-- mystery 2 1 1   -- True
-- mystery 2 1 2   -- True
-- mystery 2 2 0   -- True
-- mystery 2 2 1   -- True
-- mystery 2 2 2   -- False




