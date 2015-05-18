--
--
--
-----------------
-- Exercise 13.8.
-----------------
--
--
--
module E'13''8 where



import Prelude hiding
 (
   Ord
 , (<)
 , (>)
 , (<=)
 , (>=)
 , min
 , max
 , compare
 )

import qualified Prelude
 (
   (<)
 )




-- GHCi> :i Ordering
-- data Ordering = LT | EQ | GT    -- Defined in `GHC.Types'
-- ...



class  Eq a => Ord a  where

  (<), (<=), (>), (>=) :: a -> a -> Bool
  max, min             :: a -> a -> a
  compare              :: a -> a -> Ordering
  
  (<)  a1 a2 =  a2 > a1
  
  (>)  a1 a2 =  a2 < a1

  (<=) a1 a2 =  a1 < a2  ||  a1 == a2
  
  (>=) a1 a2 =  a1 > a2  ||  a1 == a2
  
  max a1 a2
   
   |  a1 /= a2 && a1 > a2  = a1
   |  otherwise            = a2

  min a1 a2
  
   |  a1 /= a2 && a1 < a2  = a1
   |  otherwise            = a2
  
  compare a1 a2
   
   |  a1 < a2    = LT
   |  a1 > a2    = GT
   |  otherwise  = EQ



-- Examples:


-- 1:

data OI =  O  |  I  deriving Eq


instance  Ord OI  where

  (<) O I = True
  (<) _ _ = False


{- GHCi>

O < I
I < O

O <= O
I <= I

compare O O
compare O I
compare I O
compare I I

-}
-- True
--
-- False


-- Note: This is not the official minimal definition of "Ord". The official
--       documentation says, that their minimal complete definition is:
--       compare | (<=)



-- 2:


instance  Ord Int  where

  (<) n1 n2 =  n1 Prelude.< n2


-- GHCi> (1 :: Int) < (1 :: Int)
-- False

-- GHCi> compare (1 :: Int) (2 :: Int)
-- LT




