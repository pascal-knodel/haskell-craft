--
--
--
------------------
-- Exercise 11.17.
------------------
--
--
--
module E'11'17 where



curry3 :: ( (a , b , c) -> d ) -> a -> b -> c -> d
curry3 f a b c

 =  f (a , b , c)


uncurry3 :: (a -> b -> c -> d) -> ( (a , b , c) -> d )
uncurry3 f (a , b , c)

 =  f a b c



{- GHCi>

-- Note: Chapter 3> cabal install

:m +B'C'3

(uncurry3 threeEqual) (1 , 1 , 1)
(curry3 $ uncurry3 threeEqual) 1 1 1

-}
-- True
-- True



-- Can you use "curry" and "uncurry" in these definitions?
----------------------------------------------------------
--
-- "curry3":
--
-- Sure, it would be possible to use "curry"/"uncurry" in a nonsense manner.
-- But is it possible to use one of them to improve the definition too?
--
-- The type signature of "f" in "curry3" doesn't match
-- for an application of "curry". Involving a lambda abstraction we
-- could fix that. I'll do it in two steps:


curry1 :: ( (a , b , c) -> d ) -> ( ( a , b ) -> c -> d )
curry1 f (a , b) c

 =  ( \(a , b) c -> f (a , b , c) ) (a , b) c


curry3' :: ( (a , b , c) -> d ) -> a -> b -> c -> d
curry3' f a b c

 =  (curry $ curry1 f) a b c


-- That is equivalent to:


curry3'' :: ( (a , b , c) -> d ) -> a -> b -> c -> d
curry3'' f a b c

 =  (  curry ( \(a , b) c -> f (a , b , c) )  )  a b c



-- But, if we can do it like in my first definition of "curry3", why should we do it
-- again? I imagining that we might use this equivalency in some proofs. And we read
-- directly that "curry" is a specialization of "curry3" in the definition.
--
--
-- "uncurry3":
--
-- Let's try it with a similar idea for "curry3".
-- But, the partial application of "uncurry" is possible:
--
-- uncurry :: a -> b -> c -> (a , b) -> c
--
-- uncurry f :: ( (a , b) -> c ) -> d
--
-- This time its easier we don't need to fix the application with a lambda abstraction, phew.


uncurry3' :: (a -> b -> c -> d) -> ( (a , b , c) -> d )
uncurry3' f (a , b , c)

 =  (uncurry f) (a , b) c




