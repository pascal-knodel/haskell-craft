--
--
--
-----------------
-- Exercise 3.27.
-----------------
--
--
--
module E'3'27 where




-- GHCi> :load E'3'27'
-- [1 of 1] Compiling E'3'27'          ( E'3'27'.hs, interpreted )
--
-- E'3'27'.hs:16:35: parse error on input `='
-- Failed, modules loaded: none.



-- |definition argument = argument
-- | other_Definition other_Argument = other_Argument
--
-- What's wrong?
--
-- The indentation before other_Definition states
-- that the previous definition continues (after argument)
-- in the next line.
--
-- This results in a compiler error (parse error on input `='),
-- since "... argument other_Definition ..." doesn't make any sense.





