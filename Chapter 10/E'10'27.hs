--
--
--
------------------
-- Exercise 10.27.
------------------
--
-- 
--
module E'10'27 where



import qualified E'10'28 ( getLine' )
import Prelude hiding ( getLine )




-- From chapter 7 ...


type Word = String
type Line = [Word]


-- getLine :: Int -> [Word] -> Line
getLine _   [] = []
getLine len ( w : ws )

 |  length w <= len =  w : restOfLine
 
 |        otherwise =  []
 
 where

 newlen      = len - ( length w + 1 )
 restOfLine  = getLine newlen ws


-- ...



-- Polymorphic type:
--------------------


getLine'' = getLine
getLine'' ::     Int   -- Arithmetic like "length w <= len" implies that "len" is of type Int ( length :: [a] -> Int ).
             -> [[a]]  -- We see that "w" is a list because of "length w".
             -> [[a]]


-- GHCi> :t getLine
-- getLine :: Int -> [[a]] -> [[a]]




-- Generalisation:
------------------


-- The function ("length") is involved in the test and in post-calculation, making generalisation difficult.
-- But a first idea could be trying to generalise [[a]] to [b].
--
-- Q: Does the type become more general?
-- A: Yes, if we generalise "length" out of the test by adding an argument for a polymorphic higher-order function (which could
--    be the length-function) the type becomes more general. The constraint that the third argument has to be a list of lists
--    is now released.


getLine' :: (a -> Int) -> Int -> [a] -> [a]
getLine' =  E'10'28.getLine'




