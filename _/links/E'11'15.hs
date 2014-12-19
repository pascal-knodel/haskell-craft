--
--
--
------------------
-- Exercise 11.15.
------------------
--
--
--
module E'11'15 where



-- uncurry :: (a -> b -> c) -> ( (a , b) -> c )
-- uncurry f a b =  f (a , b)


-- curry :: ( (a , b) -> c ) -> (a -> b -> c)
-- curry f (a , b) =  f a b



-- "uncurry uncurry":
---------------------


-- It becomes a function that expects a tuple argument,
-- that contains a curried function in the first place and their
-- arguments as a tuple in the second place. It is what it states -
-- the uncurried form of the "uncurry" function.


{- GHCi>

(uncurry uncurry) ( (+) , (1 , 2) )

-}
-- 3


--         uncurry :: (a -> b -> c) -> ( (a , b) -> c )
--                                                        | 'Right associativity of ->'
--   <=>   uncurry :: (a -> b -> c) ->   (a , b) -> c
--
--
--   uncurry ::  (a -> b -> c) -> (a , b) -> c
--               -------------    -------    -
--               |                |          |                        | (-- 1)
--   uncurry :: (a             -> b       -> c) -> ( (a , b) -> c )
--
--
--         uncurry :: (a -> b -> c) -> ( (a , b) -> c )
--                                                              | 'Application of "uncurry"'
--                                                              | 'Rule of cancellation'
--    =>  (uncurry uncurry) :: ( (a' , b') -> c' )
--    =>  (uncurry uncurry) ::   (a' , b') -> c'
--                                                              | 'Type replacement', see (-- 1)
--    =>  (uncurry uncurry) ::   (a -> b -> c , (a , b)) -> c


{- GHCi>

:t (uncurry uncurry)

-}
-- (uncurry uncurry) :: ( a -> b -> c , (a , b) ) -> c



-- "curry uncurry":
-------------------


-- This won't work, because the types don't match.
-- "curry" expects a function in uncurried form and this is not the case with "uncurry"
-- that is itself a curried form. It would be possible to apply "uncurry" to "curry".


{- GHCi>

:t (uncurry curry)

-}
-- (uncurry curry) :: ( (b , b1) -> c , b ) -> b1 -> c




