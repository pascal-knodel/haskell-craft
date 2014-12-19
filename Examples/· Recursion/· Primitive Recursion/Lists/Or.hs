-- List (of booleans) or.
module Or where



or :: [Bool] -> Bool
or [] = False
or (boolean : remainingBooleans)

 = boolean || (or remainingBooleans)



{- GHCi>


or []
or [False]
or [True]
or [True, False]
or [True, True]


-}
-- False
-- False
-- True
-- True
-- True


