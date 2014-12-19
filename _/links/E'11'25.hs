--
--
--
------------------
-- Exercise 11.25.
------------------
--
--
--
module E'11'25 where



-- Note: Use/See templates for proofs by extensionality.



-- (.) :: (b -> c) -> (a -> b) -> a -> c
-- (.) l r a =  l (r a)




-- ---------------
-- 1. Proposition:
-- ---------------
--
--   f . (g . h) $ x  =  (f . g) . h $ x
--
--
-- Proof By Extensionality:
-- ------------------------
--
--      f . (g . h) $ x
--   =  f ( (g . h) x )
--   =  f ( g (h x) )
--   =  (f . g) (h x)
--   =  (f . g) . h $ x
--
--
-- ■ (1. Proposition)




