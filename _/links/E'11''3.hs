--
--
--
-----------------
-- Exercise 11.3.
-----------------
--
--
--
module E'11''3 where



import GHC.Base ( id )



-- (.) is associative, so we don't need to reverse the list.
-- Functions need to have one argument.
--
-- Advice: Be always careful with your implementation:
-- https://www.haskell.org/haskellwiki/Foldr_Foldl_Foldl%27 .


composeList :: [(a -> a)] -> (a -> a)
composeList functionList =  foldl (.) id functionList


{- GHCi>

:{

let increment :: Integer -> Integer
    increment integer =  integer + 1

:}

:{

let decrement :: Integer -> Integer
    decrement integer =  integer - 1

:}

( composeList [ increment , decrement ] ) 0

-}
-- 0



-- Other solutions for "composeList":


composeList' :: [(a -> a)] -> (a -> a)
composeList' functionList =  foldr (.) id functionList


composeList'' :: [(a -> a)] -> (a -> a)
composeList'' [] = id
composeList'' (function : remainingFunctions)

 =  function . composeList'' remainingFunctions




