--
--
--
------------------
-- Exercise 10.11.
------------------
--
--
--
module E'10'11 where



import Test.QuickCheck ( quickCheck )
import Test.QuickCheck.Function ( Fun , apply )




prop_filter :: (Fun Integer Bool) -> [Integer] -> Bool
prop_filter function list

 = filterOnce == filterTwice
 
 where
 
 filterOnce :: [Integer]
 filterOnce = filter ( apply function ) list
 
 filterTwice :: [Integer]
 filterTwice = filter ( apply function ) filterOnce


-- GHCi> quickCheck prop_filter




