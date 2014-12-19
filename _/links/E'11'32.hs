--
--
--
------------------
-- Exercise 11.32.
------------------
--
--
--
module E'11'32 where



-- Notes:
--
--  - Use/See templates for proofs by structural induction.
--  - Note: Re/-member/-think/-view the definitions of "++", "." and "foldr".




-- ---------------
-- 1. Proposition:
-- ---------------
--
--   foldr f st (xs ++ ys)  =  f (foldr f st xs) (foldr f st ys)
--
--
--    Assumption 1:   "f" is associative
--
--    Assumption 2:   "st" is an identity for "f"
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
--       =>  (left) := foldr f st (xs ++ ys)
--                                                 | (Base case 1.)
--                   = foldr f st ([] ++ ys)
--                                                 | ++
--                   = foldr f st ys
--
--
--          (right) := f (foldr f st xs) (foldr f st ys)
--                                                           | (Base case 1.)
--                   = f (foldr f st []) (foldr f st ys)
--                                                           | (Assumption 1)
--                                                           | foldr
--                   = f st (foldr f st ys)
--                                                           | (Assumption 2)
--                                                           | st
--                   = foldr f st ys
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
--    For all lists "ys" and for an arbitrary, but fixed "xs", the statement ...
--
--      foldr f st (xs ++ ys)  =  f (foldr f st xs) (foldr f st ys)
--
--    ... holds.
--
--
--  1. Induction Step (1. I.S.):
--  ----------------------------
--
--
--     (left) := foldr f st ( (x : xs) ++ ys )
--                                                                | ++
--             = foldr f st ( x : (xs ++ ys) )
--                                                                | (Assumption 1)
--                                                                | foldr
--             = x `f` foldr f st (xs ++ ys)
--                                                                | (1. I.H.)
--             = x `f` f (foldr f st xs) (foldr f st ys)
--
--             = x `f` (foldr f st xs) `f` (foldr f st ys)
--
--             = ( x `f` (foldr f st xs) ) `f` (foldr f st ys)
--                                                                | General rule of function application (left associativity)
--             = ( foldr f st (x : xs) ) `f` (foldr f st ys)
--
--
--    (right) := f ( foldr f st (x : xs) ) (foldr f st ys)
--
--             = ( foldr f st (x : xs) ) `f` (foldr f st ys)
--
--
--    =>  (left) = (right)
--
--
--    ■  (1. Proof)




-- Question: Is  "foldr f st ( foldr (++) [] ls )  =  foldr ( f . (foldr f st) ) st ls"  true?




