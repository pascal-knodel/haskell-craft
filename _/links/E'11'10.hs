--
--
--
------------------
-- Exercise 11.10.
------------------
--
--
--
module E'11'10 where



import Prelude hiding ( flip )




flip :: (a -> b -> c) -> b -> a -> c
flip function

 =  \secondArgument firstArgument -> function firstArgument secondArgument 


{- GHCi>

let (<-<) =  flip (-)
0 <-< 1
1 <-< 0

-}
--  1
-- -1




-- Other solutions for "flip":



flip' :: (a -> b -> c) -> (b -> a -> c)
flip' function

 =  function'
 
 where
 
 -- function' :: (b -> a -> c)
 function' secondArgument firstArgument =  function firstArgument secondArgument


-- Note:
--
--        flip f      =  g  where  g z y  =  f y z
--
--   <=>  flip f z y  =  g z y
--                               | where
--   <=>  flip f z y  =  f y z



flip'' :: (a -> b -> c) -> (b -> a -> c)
flip'' function firstArgument secondArgument

 =  function secondArgument firstArgument




