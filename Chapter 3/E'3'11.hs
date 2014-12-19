--
--
--
-----------------
-- Exercise 3.11.
-----------------
--
--
--
module E'3'11 where



import B'C'3 (threeEqual)

import E'3''8 (mystery)




-- Notes:
--
-- - 'lazy evaluation'.
-- - 'once calculated, expressions are available' ; 'sharing'.




-- "threeEqual ( 2 + 3 ) 5 ( 11 `div` 2 )":
-------------------------------------------


--    threeEqual (2 + 3) 5 (11 `div` 2)
--
-- ~> ( ( 2 + 3 ) == 5 ) && ...
-- ~>           5 == 5   && ...
-- ~>               True && ( 5 == ( 11 `div` 2 ) )
-- ~>               True &&   5 == 5
-- ~>               True && True
-- ~> True



-- "mystery ( 2 + 4 ) 5 ( 11 `div` 2 )":
----------------------------------------


-- From ex. 3.8:
-- 
-- 
-- mystery :: Integer -> Integer -> Integer -> Bool
-- mystery a b c
-- 
--  =  not ( a == b && b == c )
-- 
--
-- ...


--      mystery ( 2 + 4 ) 5 ( 11 `div` 2 )
--
--  ~>  not (  ( ( 2 + 4 ) == 5 )  &&  ...  )
--  ~>  not (            6 == 5    &&  ...  )
--  ~>  not (               False  &&  ...  )
--  ~>  not False
--  ~>  True



-- "threeDifferent ( 2 + 4 ) 5 ( 11 `div` 2 )":
-----------------------------------------------


-- From ex. 3.9:


threeDifferent :: Integer -> Integer -> Integer -> Bool
threeDifferent a b c

 =      a /= b
    &&  a /= c
    &&  b /= c


-- ...


--     threeDifferent ( 2 + 4 ) 5 ( 11 `div` 2 )
--
--  ~>  ( ( 2 + 4 ) /= 5 )  &&  ...
--  ~>            6 /= 5    &&  ...
--  ~>                True  &&  ( 6 /= ( 11 `div` 2 ) )  &&  ...
--  ~>                True  &&  ( 6 /= 5              )  &&  ...
--  ~>                True  &&  True                     &&  ...
--  ~>                True  &&  True                     &&  ...
--  ~>                True  &&  True                     &&  5 /= 5
--  ~>                True  &&  True                     &&  False
--  ~>                True  &&  False
--  ~>  False



-- "fourEqual ( 2 + 3 ) 5 ( 11 `div` 2 ) ( 21 `mod` 11 )":
----------------------------------------------------------


-- From ex. 3.10:


fourEqual2 :: Integer -> Integer -> Integer -> Integer -> Bool
fourEqual2 a b c d

 =  threeEqual a b c  &&  c == d


-- ...


fourEqual :: Integer -> Integer -> Integer -> Integer -> Bool
fourEqual

 =  fourEqual2


--      fourEqual2 ( 2 + 3 ) 5 ( 11 `div` 2 ) ( 21 `mod` 11 )
--
--  ~>  threeEqual ( 2 + 3 ) 5 ( 11 `div` 2 ) ( 21 `mod` 11 )  &&  ( 11 `div` 2 ) == ( 21 `mod` 11 )
--
--  ~>  ( ( 2 + 3 ) == 5 )  &&  ...
--  ~>            5 == 5    &&  ...
--  ~>                True  &&  ( 5 == ( 11 `div` 2 ) )  &&  ...
--  ~>                True  &&    5 == 5                 &&  ...
--  ~>                True  &&  True                     &&  5 == ( 21 `mod` 11 )
--  ~>                True  &&  True                     &&  5 == 10
--  ~>                True  &&  True                     &&  False
--  ~>                True  &&  False
--  ~>  False




{- GHCi>

threeEqual ( 2 + 3 ) 5 ( 11 `div` 2 )
mystery ( 2 + 4 ) 5 ( 11 `div` 2 )
threeDifferent ( 2 + 4 ) 5 ( 11 `div` 2 )
fourEqual ( 2 + 3 ) 5 ( 11 `div` 2 ) ( 21 `mod` 11 )

-}
-- True
-- True
-- False
-- False




