--
--
--
----------------
-- Exercise 7.5.
----------------
--
--
--
module E'7''5 where



import Prelude hiding ( product )




product :: [Integer] -> Integer
product [] = 1
product ( integer : remainingIntegers )

 =  integer * (product remainingIntegers)




