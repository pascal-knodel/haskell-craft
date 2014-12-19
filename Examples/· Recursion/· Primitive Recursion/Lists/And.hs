-- List (of booleans) and.
module And where



and :: [Bool] -> Bool
and [] = True
and (boolean : remainingBooleans)

 = boolean && (and remainingBooleans)



{- GHCi>


and []
and [True]
and [False]
and [True, True]
and [True, False]


-}
-- True
-- True
-- False
-- True
-- False


