--
--
--
----------------
-- Exercise 9.8.
----------------
--
--
--
module E'9''8 where





-- Notes:
--
--  - Use/See templates for structural induction.
--  - Re/-member/-think/-view the definitions of "elem", "||" and "++".




-- ------------
-- Proposition:
-- ------------
--
--   elem c ( as ++ bs ) = elem c as || elem c bs
--
--
-- Proof By Structural Induction:
-- ------------------------------
--
--
--   Induction Beginning (I.B.):
--   ---------------------------
--
--
--     (Base case 1.)  :<=>  as := []
--     
--       =>  (left) := elem c ( as ++ bs )
--                                           | (Base case 1.)
--                   = elem c ( [] ++ bs )
--                                           | ++
--                   = elem c bs
--
--
--          (right) := elem c as || elem c bs
--                                               | (Base case 1.)
--                   = elem c [] || elem c bs
--                                               | elem
--                   = False || elem c bs
--                                               | (||)
--                   = elem c bs
--
--
--       => (left) = (right)
--
--       ✔
--
--
--  Induction Hypothesis (I.H.):
--  ----------------------------
--
--    For an arbitrary, but fixed list "as", the statement ...
--
--      elem c ( as ++ bs ) = elem c as || elem c bs
--
--    ... holds.
--
--
--  Induction Step (I.S.):
--  ----------------------
--
--
--     (left) := elem c ( ( a : as ) ++ bs )
--                                                    | ++
--             = elem c ( a : ( as ++ bs ) )
--                                                    | elem
--             = c == a || elem c ( as ++ bs )
--                                                    | (I.H., Associativity.)
--             = c == a || elem c as || elem c bs
--
--
--    (right) := elem c ( a : as ) || elem c bs
--                                                    | elem, (Associativity.)
--             = c == a || elem c as || elem c bs
--
--
--    =>  (left) = (right)
--
--    ■




