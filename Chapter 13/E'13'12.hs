{-# OPTIONS_GHC -XFlexibleInstances #-}
--
--
--
------------------
-- Exercise 13.12.
------------------
--
--
--
module E'13'12 where



import E'13'11
 (
   tt
 )




-- instance  Show (Bool -> Bool)  where
-- 
--   show _ =  "Bool -> Bool"


{- GHCi> 

let f :: Bool -> Bool ; f = undefined
f

-}
-- Bool -> Bool

-- Question: How would I have to rewrite the instance to make it show
--           the name of the function instead of a redundant string?
--           Are all functions anonymous? That means, to achieve
--           the functions knowing their names, I would have to
--           redefine/retype all of them?



-- Other solution for "show", I think this is what is expected?



instance  Show (Bool -> Bool)  where

  show function = tt ( \l -> function (l !! 0) ) "unknown" 1


-- GHCi> putStr $ "\n" ++ show not ++ "\n"
--
--  a1 | unknown
-- --------------
--  F  | T
--  T  | F




