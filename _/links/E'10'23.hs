--
--
--
------------------
-- Exercise 10.23.
------------------
--
-- 
--
module E'10'23 where



--          g x ( g y z ) = g ( g x y ) z
--
--  <=>  x `g` ( y `g` z ) = ( x `g` y ) `g` z




-- "foldr1 g ( xs ++ ys )":
---------------------------


-- ---------------
-- 1. Proposition:
-- ---------------
--
--   foldr1 g ( xs ++ ys ) = g ( foldr1 g xs ) ( foldr1 g ys )
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
--     (Base case 1.)  :<=>  xs := [ x ]
--     
--       =>  (left) := foldr1 g ( xs ++ ys )
--                                                     | (Base case 1.)
--                   = foldr1 g ( [ x ] ++ ys )
--
--                   = foldr1 g ( ( x : [] ) ++ ys )
--                                                     | ++
--                   = foldr1 g ( x : ( [] ++ ys ) )
--                                                     | ++
--                   = foldr1 g ( x : ys )
--
--
--          (right) := g ( foldr1 g xs ) ( foldr1 g ys )
--                                                            | (Base case 1.)
--                   = g ( foldr1 g [ x ] ) ( foldr1 g ys )
--                                                            | ++
--                   = g x ( foldr1 g ys )
--                                                            | foldr1
--                   = foldr1 g ( x : ys )
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
--    For an arbitrary, but fixed list "xs", the statement ...
--
--      foldr1 g ( xs ++ ys ) = g ( foldr1 g xs ) ( foldr1 g ys )
--
--    ... holds.
--
--
--  1. Induction Step (1. I.S.):
--  ----------------------------
--
--
--     (left) := foldr1 g ( x : xs ++ ys )
--                                                             | ++
--             = foldr1 g ( x : (xs ++ ys) )
--                                                             | foldr1
--             = g x ( foldr1 g (xs ++ ys) )
--                                                             | (1. I.H.)
--             = g x ( g (foldr1 g xs) (foldr1 g ys) )
--
--             = x `g` ( (foldr1 g xs) `g` (foldr1 g ys) )
--                                                             | (Associativity of g.)
--             = x `g` ( foldr1 g xs ) `g` ( foldr1 g ys )
--
--             = ( x `g` (foldr1 g xs) ) `g` ( foldr1 g ys )
--
--             = g ( g x (foldr1 g xs) ) ( foldr1 g ys )
--                                                             | foldr1
--             = g ( foldr1 g (x : xs) ) ( foldr1 g ys )
--
--
--    (right) := g ( foldr1 g (x : xs) ) ( foldr1 g ys )
--
--
--    =>  (left) = (right)
--
--    ■  (1. Proposition)



-- "foldr g s ( xs ++ ys )":
----------------------------


-- ---------------
-- 1. Proposition:
-- ---------------
--
--   foldr g s ( xs ++ ys ) = g ( foldr g s xs ) ( foldr g s ys )
--
--   under the assumption that
--
--   s is the left neutral element of g:
--
--     (1. Assumption)  <=>  s `g` x = x
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
--       =>  (left) := foldr g s ( xs ++ ys )
--                                              | (Base case 1.)
--                   = foldr g s ( [] ++ ys )
--                                              | ++
--                   = foldr g s ys
--
--
--          (right) := g ( foldr g s xs ) ( foldr g s ys )
--                                                           | (Base case 1.)
--                   = g ( foldr g s [] ) ( foldr g s ys )
--                                                           | foldr
--                   = g s ( foldr g s ys )
--
--                   = s `g` ( foldr g s ys )
--                                                           | (1. Assumption)
--                   = foldr g s ys
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
--    For an arbitrary, but fixed list "xs", the statement ...
--
--      foldr g s ( xs ++ ys ) = g ( foldr g s xs ) ( foldr g s ys )
--
--    ... holds.
--
--
--  1. Induction Step (1. I.S.):
--  ----------------------------
--
--
--     (left) := foldr g s ( x : xs ++ ys )
--                                                               | ++
--             = foldr g s ( x : (xs ++ ys)  )
--                                                               | foldr
--             = g x ( foldr g s (xs ++ ys) )
--                                                               | (1. I.H.)
--             = g x ( g ( foldr g s xs ) ( foldr g s ys ) )
--
--             = x `g` ( (foldr g s xs) `g` (foldr g s ys) )
--                                                               | (Associativity of g.)
--             = x `g` ( foldr g s xs ) `g` ( foldr g s ys )
--
--             = ( x `g` (foldr g s xs) ) `g` ( foldr g s ys )
--
--             = g ( g x (foldr g s xs) ) ( foldr g s ys )
--                                                               | foldr
--             = g ( foldr g s (x : xs) ) ( foldr g s ys )
--
--
--    (right) := g ( foldr g s (x : xs) ) ( foldr g s ys )
--
--
--    =>  (left) = (right)
--
--    ■  (1. Proposition)



