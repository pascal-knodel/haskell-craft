--
--
--
-----------------
-- Exercise 9.10.
-----------------
--
--
--
module E'9'10 where




-- Note: Re/-member/-think/-view the definitions of "take", "drop" and "++".
--       Be careful with the integer ranges when defining "take" and "drop" on
--       your own: definedness and behaviour of the functions on the same input
--       ranges are important here. I've used the standard prelude definitions.



-- take :: Int -> [a] -> [a]
-- take n    _   |  n <= 0 =  []
-- take _    []  =  []
-- take n (x:xs) =  x : take (n-1) xs

-- drop :: Int -> [a] -> [a]
-- drop n    xs  |  n <= 0 =  xs
-- drop _    []  =  []
-- drop n (_:xs) =  drop (n-1) xs

-- infixr 5 ++
-- (++) :: [a] -> [a] -> [a]
-- (++)      []  rs =  rs
-- (++) (l : ls) rs =  l : (++) ls rs




-- ---------------
-- 1. Proposition:
-- ---------------
--
--   take n xs ++ drop n xs  =  xs
--
--
-- Proof By Structural Induction:
-- ------------------------------
--
--
--   1. Induction Beginning (1. I.B.):
--   ---------------------------------
--
--
--     (Base case 1.)  :<=>  xs := []
--     
--       =>  (left) := take n xs ++ drop n xs
--                                                 | (Base case 1.)
--                   = take n [] ++ drop n []
--                                                 | take
--                   = [] ++ drop n []
--                                                 | drop
--                   = [] ++ []
--                                                 | ++
--                   = []
--
--
--          (right) := xs
--                            | (Base case 1.)
--                   = []
--
--
--       => (left) = (right)
--
--       ✔
--
--
--  1. Induction Hypothesis (1. I.H.):
--  ----------------------------------
--
--    For an arbitrary, but fixed list "xs" and all natural numbers "n", the statement ...
--
--      take n xs ++ drop n xs  =  xs
--
--    ... holds.
--
--
--  1. Induction Step (1. I.S.):
--  ----------------------------
--
--
--     (left) := take n (x : xs) ++ drop n (x : xs)
--
--
--             Case 1:  n <= 0 
--             ...............
--
--             (left) = take n (x : xs) ++ drop n (x : xs)
--                                                            | take
--                    = [] ++ drop n (x : xs)
--                                                            | take
--                    = [] ++ []
--                                                            | ++
--                    = []
--
--
--    Note: At this time I weakened the induction hypothesis from integers to natural numbers "n".
--          After this the first case does not disturb us any longer.
--
--
--             Case 2:  n > 0 
--             ..............
--
--             (left) = take n (x : xs) ++ drop n (x : xs)
--                                                                    | take
--                    = ( x : take (n - 1) xs ) ++ drop n (x : xs)
--                                                                    | drop
--                    = ( x : take (n - 1) xs ) ++ drop (n - 1) xs
--                                                                    | ++
--                    = x : ( take (n - 1) xs ++ drop (n - 1) xs )
--                                                                    | (1. I.H.)
--                    = x : xs
--
--
--    (right) := x : xs
--
--
--    =>  (left) = (right)
--
--
--    ■  (1. Proof)




