--
--
--
----------------
-- Exercise 7.7.
----------------
--
--
--
module E'7''7 where



import E'7''1 ( firstIncremented )
import E'7''2 ( firstTwoAdded )
import E'7''3 ( firstIncremented' , firstTwoAdded' )
import E'7''4 ( firstDigit , firstDigit' )

import qualified E'7''5 ( product )
import qualified Data.List ( product )

import qualified E'7''6 ( and , or )
import qualified GHC.List ( and , or )

import Test.QuickCheck




-- 7.1, 7.3:

prop_firstIncremented :: [Integer] -> Bool
prop_firstIncremented integerList

 =  firstIncremented integerList == firstIncremented' integerList


-- 7.2, 7.3:

prop_firstTwoAdded :: [Integer] -> Bool
prop_firstTwoAdded integerList

 =  firstTwoAdded integerList == firstTwoAdded' integerList


-- 7.4:

prop_firstDigit :: String -> Bool
prop_firstDigit string

 =  firstDigit string == firstDigit' string
 

-- 7.5:

prop_product :: [Integer] -> Bool
prop_product integers

 =  (E'7''5.product integers) == (Data.List.product integers)

 
-- 7.6:
 
prop_and, prop_or :: [Bool] -> Bool

prop_and booleanValues

 =  E'7''6.and booleanValues == GHC.List.and booleanValues

prop_or booleanValues

 =  E'7''6.or booleanValues == GHC.List.or booleanValues



{- GHCi> 

quickCheck prop_firstIncremented
quickCheck prop_firstTwoAdded
quickCheck prop_firstDigit
quickCheck prop_product
quickCheck prop_and
quickCheck prop_or

-}




