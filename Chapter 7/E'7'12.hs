--
--
--
-----------------
-- Exercise 7.12.
-----------------
--
--
--
module E'7'12 where



import Prelude hiding ( minimum , maximum )

import qualified Data.List ( minimum )
import qualified Data.List ( maximum )

import GHC.Classes ( min )
import GHC.Classes ( max )

import Test.QuickCheck




-- Subchapter 7.4, example 6 (exercise relevant definitions):


iSort :: [Integer] -> [Integer]
iSort [] = []
iSort ( integer : remainingIntegers )

 =  ins integer (iSort remainingIntegers)
 

ins :: Integer -> [Integer] -> [Integer]
ins integer [] = [integer]
ins integer ( listInteger : remainingListIntegers )
 
 |  integer < listInteger  = integer     : (listInteger : remainingListIntegers)
 |  otherwise              = listInteger : (ins integer remainingListIntegers)


-- ...



minimum :: [Integer] -> Integer
minimum integerList =  head (iSort integerList)


prop_minimum :: [Integer] -> Property
prop_minimum integerList

 =       integerList /= []
    ==>  minimum integerList == Data.List.minimum integerList


-- GHCi> quickCheck prop_minimum



-- Other solution for "minimum":


minimum' :: [Integer] -> Integer -- Primitive recursion:
minimum' [] = error "Empty list."
minimum' [ integer ] = integer
minimum' ( integer : remainingIntegers )

 =  integer `min` (minimum' remainingIntegers)


prop_minimum' :: [Integer] -> Property
prop_minimum' integerList

 =      integerList /= []
    ==> minimum' integerList == Data.List.minimum integerList


-- GHCi> quickCheck prop_minimum'



maximum :: [Integer] -> Integer
maximum integerList =  head (reverse (iSort integerList))


prop_maximum :: [Integer] -> Property
prop_maximum integerList

 =       integerList /= []
    ==>  maximum integerList == Data.List.maximum integerList


-- GHCi> quickCheck prop_maximum



-- Other solution for "maximum":


maximum' :: [Integer] -> Integer -- Primitive recursion:
maximum' [] = error "Empty list."
maximum' [ integer ] = integer
maximum' ( integer : remainingIntegers )

 =  integer `max` (maximum' remainingIntegers)


prop_maximum' :: [Integer] -> Property
prop_maximum' integerList

 =       integerList /= []
    ==>  maximum' integerList == Data.List.maximum integerList


-- GHCi> quickCheck prop_maximum'



{- GHCi>

quickCheck prop_minimum
quickCheck prop_minimum'
quickCheck prop_maximum
quickCheck prop_maximum'

-}




