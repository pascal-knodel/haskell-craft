--
--
--
-----------------
-- Exercise 10.9.
-----------------
--
--
--
module E'10''9 where




iter ::    Integer    -- Iterations (number of function applications).
        -> (t -> t)   -- Function (with an arbitrary type).
        -> t          -- Input to the function.
        -> t          -- Result (after iterative function application).

iter 0 function input = input
iter times function input

 = iter ( times - 1 ) function ( function ( input ) )   -- Tail recursion.


{- GHCi>

:{
   let addOne :: Integer -> Integer ;
   addOne integer = integer + 1
:}

iter 10 addOne 0

-}
-- 10




