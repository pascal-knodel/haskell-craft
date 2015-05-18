--
--
--
------------------
-- Exercise 13.10.
------------------
--
--
--
module E'13'10 where




-- "Bool":
----------


-- GHC/Classes:
--
-- ----------- snip -----------
--
-- deriving instance Eq Bool
--
-- ----------- snip -----------



-- Tuples:
----------


-- ---------------------------------------------------------------------------------------- snip ----------------------------------------------------------------------------------------
--
-- deriving instance  Ord ()
-- deriving instance (Ord a, Ord b) => Ord (a, b)
-- deriving instance (Ord a, Ord b, Ord c) => Ord (a, b, c)
-- ...
-- deriving instance (Ord a, Ord b, Ord c, Ord d, Ord e, Ord f, Ord g, Ord h, Ord i, Ord j, Ord k, Ord l, Ord m, Ord n, Ord o) => Ord (a, b, c, d, e, f, g, h, i, j, k, l, m, n, o)
--
-- ---------------------------------------------------------------------------------------- snip ----------------------------------------------------------------------------------------



-- (12/20/2014 02:17 AM)
--
-- GHCi> :t (,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,)
--
-- <interactive>:1:1:
--     A 63-tuple is too large for GHC
--       (max size is 62)
--       Workaround: use nested tuples or define a data type



-- Note: I don't see any 'direct' definitions of "(<)".




