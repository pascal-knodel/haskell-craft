--
--
--
----------------
-- Exercise 4.2.
----------------
--
--
--
module E'4''2 where




hasWeakAscendingOrder :: Integer -> Integer -> Integer -> Bool
hasWeakAscendingOrder a b c

 |      b >= a
    &&  b <= c  = True

 |  otherwise   = False   -- |  a > b  ||  c < b  = False



between :: Integer -> Integer -> Integer -> Bool
between a b c

 =  hasWeakAscendingOrder a b c



middleNumber :: Integer -> Integer -> Integer -> Integer
middleNumber a b c

 |      between b a c
    ||  between c a b  = a
 |      between a b c
    ||  between c b a  = b
            
 |  otherwise          = c   -- |  between a c b  ||  between c b a  = c




