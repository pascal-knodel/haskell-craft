--
--
--
------------------
-- Exercise 11.31.
------------------
--
--
--
module E'11'31 where



-- Notes:
--
--  - Use/See templates for proofs by structural induction.
--  - Note: Re/-member/-think/-view the definitions of "++", "map", "." and "foldr".



-- infixr 5 ++
-- (++) :: [a] -> [a] -> [a]
-- (++)      []  rs =  rs
-- (++) (l : ls) rs =  l : (++) ls rs

-- map :: (a -> b) -> [a] -> [b]
-- map _ []       =  []
-- map f (a : as) =  f a : map f as           -- (-- 1)

-- infixr 9 .
-- (.) :: (b -> c) -> (a -> b) -> a -> c
-- (.) bc ab a = bs $ ab a

-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- foldr _ b      []  =  b
-- foldr f b (a : as) =  a `f` foldr f b as   -- (-- 2)




-- ---------------
-- 1. Proposition:
-- ---------------
--
--   map f (ys ++ zs)  =  map f ys ++ map f zs
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
--     (Base case 1.)  :<=>  ys := []
--     
--       =>  (left)  :=  map f (ys ++ zs)
--                                          | (Base case 1.)
--                    =  map f ([] ++ zs)
--                                          | ++
--                    =  map f zs
--
--
--          (right)  :=  map f ys ++ map f zs
--                                               | (Base case 1.)
--                    =  map f [] ++ map f zs
--                                               | map
--                    =  map f zs
--
--
--       => (left)  =  (right)
--
--       ✔
--
--
--  1. Induction Hypothesis (1. I.H.):
--  ----------------------------------
--
--    For an arbitrary, but fixed list "ys", ∀ lists "zs" and ∀ functions f the statement ...
--
--      map f (ys ++ zs)  =  map f ys ++ map f zs
--
--    ... holds.
--
--
--  1. Induction Step (1. I.S.):
--  ----------------------------
--
--
--     (left)  :=  map f ( (y : ys) ++ zs )
--                                                 | ++
--              =  map f (  y : ( ys ++ zs )  )
--                                                 | map
--              =  f y : map f ( ys ++ zs )
--                                                 | (1. I.H.)
--              =  f y : map f ys ++ map f zs
--                                                 | map
--              =  map f (y : ys) ++ map f zs
--
--
--    (right)  :=  map f (y : ys) ++ map f zs
--
--
--    =>  (left)  =  (right)
--
--
--    ■  (1. Proof)




------------------
-- Other solution:



-- ---------------
-- 1. Proposition:
-- ---------------
--
--   map f (ys ++ zs)  =  map f ys ++ map f zs
--
--
--
-- Proof By Generalisation:
-- ------------------------
--
--
-- ------------------------------
-- 1. Specialization Proposition:
-- ------------------------------
--
--   map f (ys ++ zs)  =  map f ys ++ map f zs
--
--
-- ------------------------------
-- 1. Generalization Proposition:
-- ------------------------------
--
--    map f (foldr (++) [] ls)  =  foldr ( (++) . (f `map`) ) [] ls
--
--    Note: compare (--1) and (--2).
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
--     (Base case 1.)  :<=>  ls := []
--     
--       =>  (left)  :=  map f (foldr (++) [] ls)
--                                                  | (Base case 1.)
--                    =  map f (foldr (++) [] [])
--                                                  | foldr
--                    =  map f []
--                                                  | map
--                    =  []
--
--
--          (right)  :=  foldr ( (++) . (f `map`) ) [] ls
--                                                          | (Base case 1.)
--                    =  foldr ( (++) . (f `map`) ) [] []
--                                                          | foldr
--                    =  []
--
--
--       => (left)  =  (right)
--
--       ✔
--
--
--  1. Induction Hypothesis (1. I.H.):
--  ----------------------------------
--
--    For an arbitrary, but fixed (list-of-)lists "ls", the statement ...
--
--      map f ( foldr (++) [] ls )  =  foldr ( (++) . (f `map`) ) [] ls
--
--    ... holds.
--
--
--  1. Induction Step (1. I.S.):
--  ----------------------------
--
--
--     (left)  :=  map f ( foldr (++) [] (l : ls) )
--                                                                     | foldr
--              =  map f ( l ++ foldr (++) [] ls )
--                                                                     | Property of map.
--              =  map f l ++ map f ( foldr (++) [] ls )
--                                                                     | (1. I.H.)
--              =  map f l ++ (  foldr ( (++) . (f `map`) ) [] ls  )
--
--
--    (right)  :=  foldr ( (++) . (f `map`) ) [] (l : ls)
--                                                                                 | foldr
--              =  ( (++) . (f `map`) ) l foldr ( (++) . (f `map`) ) [] ls
--                                                                                 | General rule of function application (left associativity)
--              =  (  ( (++) . (f `map`) ) l  ) foldr ( (++) . (f `map`) ) [] ls
--                                                                                 | (.)
--              =  (  (++) ( (f `map`) l )  ) foldr ( (++) . (f `map`) ) [] ls
--                                                                                 | (f `map`)
--              =  (  (++) (map f l)  ) foldr ( (++) . (f `map`) ) [] ls
--                                                                                 | General rule of function application (left associativity)
--              =  (++) (map f l) ( foldr ( (++) . (f `map`) ) [] ls )
--                                                                                 | ++
--              =  map f l ++ (  foldr ( (++) . (f `map`) ) [] ls  )
--
--
--    =>  (left)  =  (right)
--
--
--    ■  (1. Generalization Proof)
--
--
--           (Generalization)
--
--    :<=>   map f ( foldr (++) [] ls )  =  foldr ( (++) . (f `map`) ) [] ls
--                                                                                            | ls := [ys , zs]
--     |=>   map f ( foldr (++) [] [ys , zs] )  =  foldr ( (++) . (f `map`) ) [] [ys , zs]
--
--     <=>   map f (ys ++ zs)  =  map f ys ++ map f zs
--
--     <=>:  (Specialization)
--
--
--    ■  (1. Specialization Proof)




