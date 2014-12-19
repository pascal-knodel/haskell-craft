--
--
--
-----------------
-- Exercise 4.17.
-----------------
--
--
--
module E'4'17 where



-- Range product example: "range product from 3 to 5" = 3 * 4 * 5 = 60.




-- Recursive:
-------------


rangeProduct :: Integer -> Integer -> Integer
rangeProduct m n

 |  m     >  n =  0
 
 |  m     == n =  m
 
 |  m + 1 == n =  m * n
 
 |   otherwise =  m * ( rangeProduct ( m + 1 ) ( n - 1 ) ) * n



-- "Hint: you do not need to use recursion [directly] in your definition, [...]" (Simon Thompson)


-- Using a list function and list comprehension - the recursion is hidden by 
-- a higher order function in the definition of product. (ignore this, 
-- for now, come back when you're done with subchapters 5.6, 6.2, and 10.1 - 10.3):

rangeProduct2 :: Integer -> Integer -> Integer
rangeProduct2 m n

 |    m  > n =  0

 | otherwise =  product [ m .. n ]




-- Other solution:


rangeProduct3 :: Integer -> Integer -> Integer
rangeProduct3 m n

 |     m > n =  0
 
 | otherwise =  foldl ( * ) 1 [ m .. n ] 




