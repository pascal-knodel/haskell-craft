--
--
--
-----------------
-- Exercise 3.10.
-----------------
--
--
--
module E'3'10 where



import B'C'3 (threeEqual)




fourEqual :: Integer -> Integer -> Integer -> Integer -> Bool
fourEqual a b c d

 =      a == b
    &&  b == c
    &&  c == d



fourEqual2 :: Integer -> Integer -> Integer -> Integer -> Bool
fourEqual2 a b c d

 = threeEqual a b c  &&  c == d




