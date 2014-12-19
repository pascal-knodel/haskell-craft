--
--
--
------------------
-- Exercise 11.28.
------------------
--
--
--
module E'11'28 where



-- Note: Use/See templates for proofs by extensionality.



-- ------------
-- Proposition:
-- ------------
--
--          "curry" and "uncurry" are inverse.
--
--   :<=>   curry . uncurry  =  uncurry . curry  =  id
--


-- ---------------
-- 1. Proposition:
-- ---------------
--
--   curry . uncurry  =  id
--
--
-- Proof By Extensionality:
-- ------------------------
--
--      curry . uncurry $ f
--   =  curry ( uncurry (f :: a -> b -> c) )
--   =  curry (f :: (a , b) -> c)
--   =  f :: a -> b -> c
--   =  id f
--
--
-- ■ (1. Proof)


-- ---------------
-- 2. Proposition:
-- ---------------
--
--   uncurry . curry  =  id
--
--
-- Proof By Extensionality:
-- ------------------------
--
--      uncurry . curry $ f
--   =  uncurry ( curry (f :: (a , b) -> c) )
--   =  uncurry (f :: a -> b -> c)
--   =  f :: (a , b) -> c
--   =  id f
--
--
-- ■ (2. Proof)


--   (1., 2. Proof)   =>   (Proposition)



-- Can you think of other pairs of inverse functions?
--
-- Yes.
--
-- Examples: (Note: specify the intervals correctly: arcsin and sin)
--
--   (1.) id and id
--   (2.) increment and decrement
--   (3.) logarithm and exponentiation
--   (4.) arccos and cos
--   ...




