--
--
--
----------------
-- Exercise 3.3.
----------------
--
--
--
module E'3''3 where



xor3 :: Bool -> Bool -> Bool
xor3 True True = False
xor3 True False = True
xor3 False True = True
xor3 False False = False


{- GHCi>

xor3 True True
xor3 True False
xor3 False True
xor3 False False

-}
-- False
-- True
-- True
-- False




