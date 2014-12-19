--
--
--
------------------
-- Exercise 11.27.
------------------
--
--
--
module E'11'27 where



-- Note: Use/See templates for proofs by extensionality.



-- flip :: (a -> b -> c) -> (b -> a -> c)
-- flip f a b =  f b a




-- ---------------
-- 1. Proposition:
-- ---------------
--
--   flip . flip  =  id
--
--
-- Proof By Extensionality:
-- ------------------------
--
--      (flip . flip) (f :: a -> b -> c)
--   =  flip (flip f)
--   =  flip (f :: b -> a - > c)
--   =  f :: a -> b -> c
--   =  f
--   =  id f
--
--
-- ■ (1. Proof)




