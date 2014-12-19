--
--
--
-----------------
-- Exercise 9.13.
-----------------
--
--
--
module E'9'13 where



-- Note: Use/See templates for structural induction.



import Test.QuickCheck ( Positive (..) , quickCheck )




-- Exercise (definitions from the text):


facAux :: Integer -> Integer -> Integer
facAux 0 p = p
facAux n p = facAux ( n - 1 ) ( n * p )


fac2 :: Integer -> Integer
fac2 n  = facAux n 1


-- ...



fac :: Integer -> Integer
fac factor 

 |  factor < 0 = error "Negative factor."
 |  otherwise  = fac' factor
 
 where
 
 fac'  :: Integer -> Integer
 fac' 0      = 1
 fac' factor = factor * fac' (factor - 1)



-- ---------------
-- 1. Proposition:
-- ---------------
--
--        fac n = fac2 n
--   <=>  fac n = facAux n 1
--
--
-- Proof By Induction:
-- -------------------
--
--
--   1. Induction Beginning (1. I.B.):
--   ---------------------------------
--
--
--     (Base case 1.)  :<=>  n := 0
--     
--       =>  (left) := fac n
--                             | (Base case 1.)
--                   = fac 0
--                             | fac
--                   = 1
--
--
--          (right) := fac2 n
--                                  | (Base case 1.)
--                   = fac2 0
--                                  | fac2
--                   = facAux 0 1
--                                  | facAux
--                   =  1
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
--    For an arbitrary, but fixed natural number n, the statement ...
--
--           fac n = fac2 n
--      <=>  fac n = facAux n 1
--
--    ... holds.
--
--
--  1. Induction Step (1. I.S.):
--  ----------------------------
--
--
--     (left) := fac ( n + 1 )
--                                                    | fac
--             = ( n + 1 ) * fac' ( ( n + 1 ) - 1 )
--                                                    | (Arithmetic.)
--             = ( n + 1 ) * fac' n
--                                                    | (I.H.)
--             = ( n + 1 ) * facAux n 1
--                                                    | ...?
--             = ...?
--
--
--    (right) := fac2 ( n + 1 )
--                                                            | fac 2
--             = facAux ( n + 1 ) 1
--                                                            | facAux
--             = facAux ( ( n + 1 ) - 1 ) ( ( n + 1 ) * p )
--                                                            | (Arithmetic.)
--             = facAux n ( ( n + 1 ) * p )
--                                                            | ...?
--             = ...?
--
--
-- ---------------
-- 2. Proposition:
-- ---------------
--
--            fac n = fac2 n
--   <=>  p * fac n = facAux n p
--
--
--   2. Induction Beginning (2. I.B.):
--   ---------------------------------
--
--
--     (Base case 1.)  :<=>  n := 0
--     
--       =>  (left) := p * fac n
--                                     | (Base case 1.)
--                   = p * fac 0
--                                     | 
--                   = p * 1
--                                     | 
--                   = p
--
--
--          (right) := facAux n p
--                                        | (Base case 1.)
--                   = facAux 0 p
--                                        | 
--                   = p
--
--
--       => (left) = (right)
--
--       ✔
--
--
--  2. Induction Hypothesis (2. I.H.):
--  ----------------------------------
--
--    For an arbitrary, but fixed natural number n
--    and for all natural numbers p, the statement ...
--
--               fac n = fac2 n
--      <=>  p * fac n = facAux n p
--
--    ... holds.
--
--
--  2. Induction Step (2. I.S.):
--  ----------------------------
--
--
--     (left) := p * fac ( n + 1 )
--                                                            | fac
--             = p * ( n + 1 ) * fac n
--
--
--    (right) := facAux ( n + 1 ) p
--                                                            | facAux
--             = facAux ( ( n + 1 ) - 1 ) ( ( n + 1 ) * p )
--                                                            | (Arithmetic.)
--             = facAux n ( ( n + 1 ) * p )
--                                                            | (2. I.H.)
--             = ( ( n + 1 ) * p ) * fac n
--                                                            | (Associativity.)
--             = ( n + 1 ) * p * fac n
--
--
--    =>  (left) = (right)
--
--    ■  (2. Proposition)
--
--
-- 
-- Test, choosing "p" for ...
--
--
--   (1.) fac n = p * fac n
--
--   ... and ...
--
--   (2.) facAux n 1 = facAux n p
--
--   ... to hold:
--
--
--  (1.)
--
--    p * fac n
--                   | p := 1
--    = 1 * fac n
--                   | (Neutral element of *.)
--    = fac n
--
--  (2.)
--
--    facAux n p
--                   | p = 1
--    = facAux n 1
--
--  ✔



prop_FacFacAux :: (Positive Integer) -> (Positive Integer) -> Bool
prop_FacFacAux (Positive n) (Positive p)

 = p * fac n == facAux n p


-- quickCheck prop_FacFacAux




