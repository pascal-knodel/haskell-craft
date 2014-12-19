--
--
--
-----------------
-- Exercise 11.4.
-----------------
--
--
--
module E'11''4 where



-- An application operator, we call it ($), needs a function
-- and an argument to apply it to the function.
--
-- We start with the most general function type "(a -> b)", "a" is for
-- the input and "b" for the output. Because the next needed type variable denotes
-- the input for our function, it has to be of the same name as the input type is
-- specified in the function type "(a -> b)", that is "a". The same applies to the
-- output, that is "b":
--
--    ($) :: (a -> b) -> a -> b
--


{- GHCi>

:t ($)

-}
-- ($) :: (a -> b) -> a -> b




