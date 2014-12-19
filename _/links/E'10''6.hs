--
--
--
-----------------
-- Exercise 10.6.
-----------------
--
--
--
module E'10''6 where




-- ( A ):
-- ------


squares :: ( Num t , Ord t ) => [t] -> [t]
squares numbers

 = map square numbers
 
 where
 
 square :: ( Num t , Ord t ) => t -> t
 square number = number * number


{- GHCi>

squares []
squares [ 0 , 1 ]
squares [ 1 , 2 ]

-}
-- []
-- [0,1]
-- [1,4]




-- ( B ):
-- ------


sumSquares :: ( Num t , Ord t ) => [t] -> t
sumSquares numbers

 = sum ( squares numbers )


{- GHCi>

sumSquares []
sumSquares [ 0 , 1 ]
sumSquares [ 1 , 2 ]

-}
-- 0
-- 1
-- 5




-- ( C ):
-- ------


arePositive :: ( Num t , Ord t ) => [t] -> Bool
arePositive numbers

 = filter lesserOrEqualZero numbers == []
 
 where
 
 lesserOrEqualZero :: ( Num t , Ord t ) => t -> Bool
 lesserOrEqualZero number = number <= 0


{- GHCi>

arePositive []
arePositive [ 0 , 1 ]
arePositive [ 1 , 2 ]

-}
-- True
-- False
-- True



-- Other solution for "arePositive":


arePositive2 :: ( Num t , Ord t ) => [t] -> Bool
arePositive2 numbers

 = Prelude.and ( map positive numbers )
 
 where
 
 positive :: ( Num t , Ord t ) => t -> Bool
 positive number = number > 0




