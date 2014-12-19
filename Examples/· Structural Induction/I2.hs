module I2 where



import Prelude hiding (
                         length ,
                         (++)
                      )

import Test.QuickCheck




length :: [t] -> Integer
length [] = 0
length (item : remainingItems)

 = 1 + length remainingItems



(++) :: [t] -> [t] -> [t]
(++) []                              rightList = rightList
(++) (leftItem : remainingLeftItems) rightList

 = leftItem : (remainingLeftItems ++ rightList)



-- ------------
-- Proposition:
-- ------------
--
--   length ( leftList ++ rightList ) = length leftList + length rightList
--
--
-- Proof By Induction:
-- -------------------
--
--
--   Induction Begin (I.B.):
--   -----------------------
--
--     (Base case.) :<=> leftList := []
--     
--
--       =>  (left) := length ( leftList ++ rightList )
--                                                        | (Base case 1.)
--                   = length ( [] ++ rightList )
--                                                        | (Neutral element of ++.)
--                   = length ( rightList )
--
--
--          (right) := length leftList + length rightList
--                                                          | (Base case 1.)
--                   = length [] + length rightList
--                                                          | length
--                   = 0 + length rightList
--                                                          | (Neutral element of +.)
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
--
--    For an arbitrary, but fixed list leftLength, the statement ...
--
--      length ( leftList ++ rightList ) = length leftList + length rightList
--
--    ... holds.
--
--
--  Induction Step (I.S.):
--  ----------------------
--
--
--     (left) := length ( (leftItem : remainingLeftItems) ++ rightList )
--                                                                           | ++
--             = length ( leftItem : ( remainingLeftItems ++ rightList ) )
--                                                                           | length
--             = 1 + length ( remainingLeftItems ++ rightList )
--                                                                           | (I.H.)
--             = 1 + length remainingLeftItems + length rightList
--
--
--    (right) := length ( leftItem : remainingLeftItems ) + length rightList
--                                                                             | length
--             = 1 + length remainingLeftItems + length rightList
--
--
--    =>  (left) = (right)
--
--    ■



prop_lengthPlusPlus :: [Integer] -> [Integer] -> Bool
prop_lengthPlusPlus leftList rightList

 = length ( leftList ++ rightList ) == length leftList + length rightList


-- GHCi> quickCheck prop_lengthPlusPlus


