{-# OPTIONS_GHC -XFlexibleInstances #-}
--
--
--
------------------
-- Exercise 13.13.
------------------
--
--
--
module E'13'13 where



import B'C'13




instance  Info (Show a) => Show (a -> a)  where

  show function =  show (function (examples !! 0)) 


-- GHCi>
--

-- Question: How do I make "show" work on "examples !! 0"?




