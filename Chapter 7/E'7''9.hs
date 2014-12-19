--
--
--
----------------
-- Exercise 7.9.
----------------
--
--
--
module E'7''9 where



import E'7''8 ( elemNum )

import Test.QuickCheck




unique :: [Integer] -> [Integer]
unique [] = []
unique (integer : remainingIntegers)

 |  elemNum integer remainingIntegers == 0  = integer : (unique remainingIntegers)
 |  otherwise                               =           (unique (remove integer remainingIntegers))
 
 where
 
 remove :: Integer -> [Integer] -> [Integer]
 remove _ [] = []
 remove integer (otherInteger : remainingIntegers)
 
  |  integer /= otherInteger  = otherInteger : (remove integer remainingIntegers)
  |  otherwise                =                (remove integer remainingIntegers)


{- GHCi>

unique []

unique [ 1 , 2 ]
unique [ 1 , 1 ]

unique [ 1 , 2 , 3 ]
unique [ 1 , 2 , 2 ]

-}
-- []
--
-- [ 1 , 2 ]
-- [       ]
--
-- [ 1 , 2 , 3 ]
-- [ 1         ]



unique' :: [Integer] -> [Integer]
unique' integerList

 =  [ integer | integer <- integerList , elemNum integer integerList == 1 ]


prop_unique :: [Integer] -> Bool
prop_unique integerList

 =  unique integerList == unique' integerList


{- GHCi>

quickCheck prop_unique

-}




