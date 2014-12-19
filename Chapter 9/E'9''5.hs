--
--
--
----------------
-- Exercise 9.5.
----------------
--
--
--
module E'9''5 where



-- Notes:
--
--  - Use/See templates for structural induction.
--  - Note: Re/-member/-think/-view the definitions of "sum" and "++".




-- ------------
-- Proposition:
-- ------------
--
--   sum ( left ++ right ) = sum left + sum right
--
--
-- Proof By Structural Induction:
-- ------------------------------
--
--
--   Induction Beginning (I.B.):
--   ---------------------------
--
--     (Base case 1.)  :<=>  left := []
--     
--
--       =>  (left) := sum ( left ++ right )
--                                             | (Base case 1.)
--                   = sum ( [] ++ right )
--                                             | sum; (Neutral element of ++.)
--                   = sum right
--
--
--          (right) := sum left + sum right
--                                            | (Base case 1.)
--                   = sum [] + sum right
--                                            | sum
--                   = 0 + sum right
--                                            | sum; (Neutral element of +.)
--                   = sum right
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
--    For an arbitrary, but fixed list "left", the statement ...
--
--      sum ( left ++ right ) = sum left + sum right
--
--    ... holds.
--
--
--  Induction Step (I.S.):
--  ----------------------
--
-- 
--     (left) := sum ( ( leftItem : remainingLeftItems ) ++ right )
--                                                                    | ++
--             = sum ( leftItem : ( remainingLeftItems ++ right ) )
--                                                                    | sum
--             = leftItem + sum (  remainingLeftItems ++ right )
--                                                                    | (I.H.)
--                                                                    | (Associativity.)
--             = leftItem + sum remainingLeftItems + sum right
--
--
--    (right) := sum ( leftItem : remainingLeftItems ) + sum right
--                                                                    | sum
--                                                                    | (Associativity.)
--             = leftItem + sum remainingLeftItems + sum right
--
--
--    =>  (left) = (right)
--
--    ■




