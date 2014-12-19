--
--
--
------------------
-- Exercise 11.19.
------------------
--
--
--
module E'11'19 where



import B'C'11
 (
   iter
 , double
 , comp2
 , succ
 )

import Prelude hiding ( succ )




-- iter :: Integer -> (a -> a) -> (a -> a)
-- iter n f
--  |  n > 0      = f . iter (n - 1) f
--  |  otherwise  = id


-- double :: Integer -> Integer
-- double =  (* 2)


-- comp2 :: (a -> b) -> (b -> b -> c) -> (a -> a -> c)
-- comp2 f g =  \x y -> g (f x) (f y)


-- succ :: Integer -> Integer
-- succ n =  n + 1


-- (.) :: (b -> c) -> (a -> b) -> a -> c
-- (.) f g = \x -> f (g x)


-- sq :: Num a => a -> a
-- sq x =  x * x

-- add :: Num a => a -> a -> a
-- add y z =  y + z




-- "iter 3 double 1":
---------------------


-- Notes: Function application is left associative.
--
{- GHCi>

:i (.)

-}
-- ...
-- infixr 9 .


--       iter 3 double 1
--   =  (iter 3 double) ...
--      ??
--      ??      3 > 0
--      ??  ~>  True
--      ??
--  ~>   ( double  .  iter (3 - 1) double ) ...
--  ~>   ( double  .  iter 2       double ) ...
--                   ??
--                   ??      2 > 0
--                   ??  ~>  True
--                   ??
--  ~>   ( double  .  (  double  .  iter (2 - 1) double  ) ) ...
--  ~>   ( double  .  (  double  .  iter 1       double  ) ) ...
--                                 ??
--                                 ??      1 > 0
--                                 ??  ~>  True
--                                 ??
--  ~>   ( double  .  (  double  .  (   double  .  iter (1 - 1) double   )  ) ) ...
--  ~>   ( double  .  (  double  .  (   double  .  iter 0       double   )  ) ) ...
--                                                ??
--                                                ??      0 > 0
--                                                ??  ~>  False
--                                                ??
--                                                ??      otherwise
--                                                ??  ~>  True
--                                                ??
--  ~>   ( double  .  (  double  .  (   double  .  id   )  ) ) ...
--  ~>   ( double  .  (  double  .  (   \a -> double (id a)   )  ) ) ...
--  ~>   ( double  .  (  \b -> double  (   \b -> double (id b)   )  ) ) ...
--  ~>   ( \c -> double  (  \c -> double  (   \c -> double (id c)   )  ) ) ...
--  ~>   ( \c -> double  (  \c -> double  (   \c -> double (id c)   )  ) ) 1
--  ~>   ( double  (  double  (   double (id 1)   )  ) )
--  ~>   ( double  (  double  (   double 1   )  ) )
--  ~>   ( double  (  double  2  ) )
--  ~>   ( double  4 )
--  ~>   8


{- GHCi>

iter 3 double 1

-}
-- 8



-- "( comp2 succ (*) ) 3 4":
--------------------------


--      ( comp2 succ (*) ) 3 4
--  ~>  ( \x y -> (*) (succ x) (succ y) ) ...
--  ~>  ( \x y -> (*) (succ x) (succ y) ) 3 4
--  ~>  (*) (succ 3) (succ 4)
--  ~>  (*) 4        (succ 4)
--  ~>  (*) 4        5
--  ~>  20


{- GHCi>

comp2 succ (*) 3 4

-}
-- 20



-- "comp2 sq add 3 4":
----------------------


--      comp2 sq add 3 4
--
--  ~>  add (sq 3)  (sq 4)
--  ~>  add (3 * 3) (sq 4)
--  ~>  add 9       (sq 4)
--  ~>  add 9       (4 * 4)
--  ~>  add 9       16
--
--  ~>  9 + 16
--  ~>  25


{- GHCi>


:{
let sq :: Num a => a -> a
    sq x =  x * x
:}

:{
let add :: Num a => a -> a -> a
    add y z =  y + z
:}

comp2 sq add 3 4


-}
-- 25




-- Question: If one would be over accurate, how would single evaluation steps look like?
--           What I'm talking about, example: "iter 3 double 1"
--           - isn't it interpreted "(iter 3) ..."?




