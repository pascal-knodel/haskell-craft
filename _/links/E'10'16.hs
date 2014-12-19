--
--
--
------------------
-- Exercise 10.16.
------------------
--
--
--
module E'10'16 where



import Test.QuickCheck ( quickCheck )




mystery xs

 = foldr ( ++ ) [] ( map sing xs )

 where
 
 sing x = [ x ]


-- First "map sing xs" is applied to the input list and transforms every
-- item into a singleton list, holding the item. Then all these single-item-lists
-- are concatenated. The result is the list, "mystery" is applied to:
--
--   mystery xs = xs


{- GHCi>

mystery []
mystery [ 0 ]
mystery [ 0 , 1 ]

-}
-- []
-- [ 0 ]
-- [ 0 , 1 ]



prop_mystery :: [Integer] -> Bool
prop_mystery list

 = mystery list == list


-- GHCi> quickCheck prop_mystery



-- ---------------
-- 1. Proposition:
-- ---------------
--
--   mystery xs = xs
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
--       =>  (left) := mystery xs
--                                                       | (Base case 1.)
--                   = mystery []
--                                                       | mystery
--                   = foldr ( ++ ) [] ( map sing [] )
--                                                       | map
--                   = foldr ( ++ ) [] []
--                                                       | foldr
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
--    For an arbitrary, but fixed list "xs", the statement ...
--
--                                mystery xs = xs
--      <=>  foldr ( ++ ) [] ( map sing xs ) = xs
--
--    ... holds.
--
--
--  1. Induction Step (1. I.S.):
--  ----------------------------
--
--
--     (left) := mystery ( x : xs )
--                                                           | mystery
--             = foldr ( ++ ) [] ( map sing ( x : xs ) )
--                                                           | map
--             = foldr ( ++ ) [] ( sing x : map sing xs )
--                                                           | sing
--             = foldr ( ++ ) [] ( [ x ] : map sing xs )
--                                                           | foldr
--             = [ x ] ++ foldr ( ++ ) [] ( map sing xs )
--                                                           | mystery
--             = [ x ] ++ mystery xs
--                                                           | (1. I.H.)
--             = [ x ] ++ xs
--
--             = ( x : [] ) ++ xs
--                                                           | ++
--             = x : ( [] ++ xs )
--                                                           | ++
--             = x : xs
--
--
--    (right) := x : xs
--
--
--    =>  (left) = (right)
--
--    ■  (1. Proposition)




