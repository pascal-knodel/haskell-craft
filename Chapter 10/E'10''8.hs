--
--
--
-----------------
-- Exercise 10.8.
-----------------
--
--
--
module E'10''8 where




twice function input

 = ( function . function ) input


 
-- Type of "twice" according to the description from the text:

twice' :: (Integer -> Integer) -> Integer -> Integer
twice' = twice



-- Most general type of "twice" according to GHCi type inference:

-- GHCi> :t twice
twice :: (a -> a) -> a -> a




