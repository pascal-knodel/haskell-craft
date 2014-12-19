--
--
--
------------------
-- Exercise 11.29.
------------------
--
--
--
module E'11'29 where



-- Note: Use/See templates for proofs by induction.



-- iter :: Integer -> (a -> a) -> (a -> a)
-- iter n f
--  |  n > 0      = f . iter (n - 1) f
--  |  otherwise  = id




-- ---------------
-- 1. Proposition:
-- ---------------
--
--   iter n id  =  id   ("n" is a natural number, "id" is fixed)
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
--     (Base case 1.)  :<=>  n := 1
--     
--       =>  (left)  :=  iter 1 id
--                                                  | iter
--                    =    iter 1 id
--                        ??
--                        ??      1 > 0
--                        ??  ~>  True
--                        ??
--                    ~>   id . iter (1 - 1) id
--                    ~>   id . iter 0 id
--                             ??
--                             ??      0 > 0
--                             ??  ~>  False
--                             ??
--                             ??      otherwise
--                             ??  ~>  True
--                             ??
--                    ~>   id . id
--                    :=  (*)
--
--
--
-- ---------------
-- 2. Proposition:
-- ---------------
--
--   id . id  =  id
--
--
-- Proof By Extensionality:
-- ------------------------
--
--      id . id $ x
--   =  id (id x)
--   =  id x
--
--
-- ■ (2. Proof)
--
--
--
--       =>      (*)  =  id
--
--
--          (right)  :=  id
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
--    For an arbitrary, but fixed natural number "n", the statement ...
--
--      iter n id = id
--
--    ... holds.
--
--
--  1. Induction Step (1. I.S.):
--  ----------------------------
--
--
--     (left)  :=  iter (n + 1) id
--                                                 | (n + 1) > 0
--              =  id . iter ( (n + 1) - 1 ) id
--                                                 | Arithmetic
--              =  id . iter n id
--                                                 | (1. I.H.)
--              =  id . id
--                                                 | (2. Proof)
--              =  id
--
--
--    (right)  :=  id
--
--
--    =>  (left) = (right)
--
--
--    ■  (1. Proof)




