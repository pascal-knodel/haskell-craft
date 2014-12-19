--
--
--
----------------
-- Exercise 9.4.
----------------
--
--
--
module E'9''4 where



-- Notes:
--
--  - Use/See templates for structural induction.
--  - Re/-member/-think/-view the definitions of "reverse" and "++".



-- ------------
-- Proposition:
-- ------------
--
--         flipV (left `above` right) == (flipV left) `above` (flipV right) 
--   <=>  map reverse (left ++ right) == (map reverse left) ++ (map reverse right)
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
--       =>  (left) := map reverse (left ++ right)
--                                                   | (Base case 1.)
--                   = map reverse ([] ++ right)
--                                                   | ++; (Neutral element of ++.)
--                   = map reverse right
--
--
--          (right) := (map reverse left) ++ (map reverse right)
--                                                                 | (Base case 1.)
--                   = (map reverse []) ++ (map reverse right)
--                                                                 | map
--                   = [] ++ (map reverse right)
--                                                                 | ++; (Neutral element of ++.)
--                   = map reverse right
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
--            flipV (left `above` right) == (flipV left) `above` (flipV right)
--      <=>  map reverse (left ++ right) == (map reverse left) ++ (map reverse right)
--
--    ... holds.
--
--
--  Induction Step (I.S.):
--  ----------------------
--
-- 
--     (left) := flipV ( ( leftLine : left ) `above` right )
--                                                                                      | flipV, above
--             = map reverse ( ( leftLine : left ) ++ right )
--                                                                                      | ++
--             = map reverse ( leftLine : ( left ++ right ) )
--                                                                                      | map
--             = reverse leftLine : map reverse (left ++ right)
--                                                                                      | (I.H.)
--             = reverse leftLine : ( ( map reverse left ) ++ ( map reverse right ) )
--
--
--    (right) := ( flipV ( leftLine : left ) ) `above` ( flipV right )
--                                                                                      | flipV, above
--             = ( map reverse ( leftLine : left ) ) ++ ( map reverse right )
--                                                                                      | map
--             = ( reverse leftLine : map reverse left ) ++ ( map reverse right )
--                                                                                      | (Associativity.)
--             = reverse leftLine : ( ( map reverse left ) ++ ( map reverse right ) )
--
--
--    =>  (left) = (right)
--
--    ■


-- Note: Questions you should have an answer for:
--       What variable did you choose for induction and why did you choose it?




