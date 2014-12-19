--
--
--
----------------
-- Exercise 6.2.
----------------
--
--
--
module E'6''2 where



id x =  x

-- Proposition: [[a]] -> [[a]] is the most general type for id.
-- Counter-example: [a'] -> [a'] is another possible type, which is more general
-- than [[a]] -> [[a]]. [[a]] -> [[a]] is an instance of [a'] -> [a'].
-- a -> a is the most general type for id.

-- GHCi> :t id
-- id :: t -> t




