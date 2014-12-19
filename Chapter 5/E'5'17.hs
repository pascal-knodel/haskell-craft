--
--
--
-----------------
-- Exercise 5.17.
-----------------
--
--
--
module E'5'17 where



-- GHCi> [2 .. 2]
-- [2]

-- [n .. n] results in the list [n].


-- GHCi> [2, 7 .. 4]
-- [2]

-- [2, 7 .. 4] results in the list [2].


-- GHCi> [2, 2 .. 2]
-- [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
-- ,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
-- ,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
-- ,2,2,2,2,2,2,2,2,2,2,2,2,2Interrupted.

-- [n, n .. n] (ao.) results in an infinite calculation that has to be interrupted.




