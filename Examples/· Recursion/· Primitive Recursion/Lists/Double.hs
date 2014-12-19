-- Double all integers in a list.
module Double where



double :: [Integer] -> [Integer]
double [] = []
double (integer : remainingIntegers)

 = (2 * integer) : double remainingIntegers



{- GHCi>


double []
double [1]
double [1, 1]


-}
-- []
-- [2]
-- [2, 2]


