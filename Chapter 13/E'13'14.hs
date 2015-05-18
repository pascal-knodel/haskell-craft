--
--
--
------------------
-- Exercise 13.14.
------------------
--
--
--
module E'13'14 where   -- FIXME, BAD DAY



import Prelude hiding
 (
   (<)
 , (>)
 )

-- Note: Chapter 4> cabal install

import B'C'4
 (
   Move ( Rock , Paper , Scissors )
 )




class  NonEnum a  where

  (<) :: a -> a -> Bool
  (>) :: a -> a -> Bool
  
  (<) _ _ = False
  (>) _ _ = False
  


instance NonEnum Move where


{- GHCi>

Rock < Rock
Rock > Rock

-}
-- False
--
-- False



-- Other examples: constant 'things'




