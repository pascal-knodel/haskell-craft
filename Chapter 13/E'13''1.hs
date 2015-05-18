--
--
--
-----------------
-- Exercise 13.1.
-----------------
--
--
--
module E'13''1 where



import Prelude hiding ( (\=) )




-- (\=) :: Eq a => a -> a -> Bool
(\=) a b =  not (a == b)


-- GHCi> :t (\=)
-- (\=) :: Eq a => a -> a -> Bool




