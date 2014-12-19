--
--
--
-----------------
-- Exercise 3.13.
-----------------
--
--
--
module E'3'13 where



import Prelude hiding ( max )




max :: Integer -> Integer -> Integer
max a b

 |  a >= b     = a
 |  otherwise  = b


--      max ( 3 - 2 ) ( 3 * 8 )
--     ??
--     ??      3 - 2 >= 3 * 8
--     ??  ~>  1 >= 24
--     ??  ~>  False
--     ??
--     ??      otherwise
--     ??  ~>  True
--     ??
-- ~>   24



maxThree :: Integer -> Integer -> Integer -> Integer
maxThree a b c

 |       a > b
     &&  a > c  = a
    
 |  b > c       = b
 
 |  otherwise   = c


--      maxThree ( 4 + 5 ) ( 2 * 6 ) ( 100 `div` 7 )
--     ??
--     ??      ( 4 + 5  >  2 * 6 )  &&  ...
--     ??  ~>  (     9  >  2 * 6 )  &&  ...
--     ??  ~>  (     9  >  12    )  &&  ...
--     ??  ~>                False  &&  ...
--     ??  ~>  False
--     ??
--     ??      ( 12  >  100 `div` 7 )
--     ??  ~>  ( 12  >  14          )
--     ??  ~>  False
--     ??
--     ??      otherwise
--     ??  ~>  True
--     ??
--  ~>  14




