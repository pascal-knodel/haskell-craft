--
--
--
------------------
-- Exercise 11.14.
------------------
--
--
--
module E'11'14 where



-- uncurry :: (a -> b -> c) -> ( (a , b) -> c )
-- uncurry f (x , y) =  f x y

-- Because -> is right associative, the type of uncurry
-- is equivalent to "(a -> b -> c) -> (a , b) -> c".




-- "uncurry ($)":
-----------------


-- The effect of applying "uncurry" to "($)" is that the curried form of "($)"
-- will be converted to an uncurried form where the first two arguments
-- have to be supplied as a tuple.


{- GHCi>

:t ($)

-}
-- ($) :: (a -> b) -> a -> b


-- ($)     ::  (a -> b) -> a -> b
--             --------    -    -
--             |           |    |                        | (-- 1)
-- uncurry :: (a        -> b -> c) -> ( (a , b) -> c )
--
--
--         uncurry :: (a -> b -> c) -> ( (a , b) -> c )
--                                                        | 'Application of "($)"'
--                                                        | 'Rule of cancellation'
--    =>  (uncurry ($)) :: ( (a' , b') -> c' )
--                                                        | Right associativity of "->"
--    =>  (uncurry ($)) ::   (a' , b') -> c'
--                                                        | 'Type replacement' / Polymorphism, see (-- 1)
--    =>  (uncurry ($)) ::   (a -> b , a) -> b


{- GHCi>

:t (uncurry ($))

-}
-- (uncurry ($)) :: (b -> c , b) -> c



-- "uncurry (:)":
-----------------


-- Again the effect will be the conversion of the function "(:)" from a curried to an uncurried form.


{- GHCi>

:t (:)

-}
-- (:) :: a -> [a] -> [a]


-- (:)     ::  a -> [a] -> [a]
--             -    ---    ---
--             |    |      |                          | (-- 1)
-- uncurry :: (a -> b   -> c  ) -> ( (a , b) -> c )
--
--
--         uncurry :: (a -> b -> c) -> ( (a , b) -> c )
--                                                        | 'Application of "(:)"'
--                                                        | 'Rule of cancellation'
--    =>  (uncurry (:)) :: ( (a' , b') -> c' )
--                                                        | Right associativity of "->"
--    =>  (uncurry (:)) ::   (a' , b') -> c'
--                                                        | 'Type replacement' / Polymorphism, see (-- 1)
--    =>  (uncurry (:)) ::   (a , [a]) -> [a]


{- GHCi>

:t (uncurry (:))

-}
-- (uncurry (:)) :: (a , [a]) -> [a]



-- "uncurry (.)":
-----------------


-- Again the effect will be the conversion of the function "(.)" from a curried to an uncurried form.


{- GHCi>

:t (.)

-}
-- (.) :: (b -> c) -> (a -> b) -> a -> c


-- (.)     ::  (b -> c) -> (a -> b) -> a -> c
--             --------    --------    ------
--             |           |           |                          | (-- 1)
-- uncurry :: (a        -> b        -> c  ) -> ( (a , b) -> c )
--
--
--         uncurry :: (a -> b -> c) -> ( (a , b) -> c )
--                                                         | 'Application of "(:)"'
--                                                         | 'Rule of cancellation'
--    =>  (uncurry (.)) :: ( (a' , b') -> c' )
--                                                         | Right associativity of "->"
--    =>  (uncurry (.)) ::   (a' , b') -> c'
--                                                         | 'Type replacement' / Polymorphism, see (-- 1)
--    =>  (uncurry (.)) ::   (b -> c , a -> b) -> a -> c


{- GHCi>

:t (uncurry (.))

-}
-- (uncurry (.)) :: (b -> c , a -> b) -> a -> c




