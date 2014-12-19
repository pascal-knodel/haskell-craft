--
--
--
-----------------
-- Exercise 5.18.
-----------------
--
--
--
module E'5'18 where



doubleAll :: [Integer] -> [Integer]
doubleAll xs

 =  [ 2 * x | x <- xs ]



-- Other solution for "doubleAll":


doubleAll' :: [Integer] -> [Integer]
doubleAll' xs

 =  map (2 *) xs




