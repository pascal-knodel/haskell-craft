--
--
--
------------------
-- Exercise 11.12.
------------------
--
--
--
module E'11'12 where



-- GHCi> :t ( filter (>0) . map (+1) )
-- ( filter (>0) . map (+1) ) :: (Ord a, Num a) => [a] -> [a]


{- GHCi>

( filter (>0) . map (+1) ) [  0 ]
( filter (>0) . map (+1) ) [ -1 ]

-}
-- [ 1 ]
-- [   ]



{- GHCi>

( map (+1) . filter (>(-1)) ) [  1 ]
( map (+1) . filter (>(-1)) ) [  0 ]
( map (+1) . filter (>(-1)) ) [ -1 ]

( map (1+) . filter (>(-1)) ) [  1 ]
( map (1+) . filter (>(-1)) ) [  0 ]
( map (1+) . filter (>(-1)) ) [ -1 ]

( map (+1) . filter ((-1)<) ) [  1 ]
( map (+1) . filter ((-1)<) ) [  0 ]
( map (+1) . filter ((-1)<) ) [ -1 ]

( map (1+) . filter ((-1)<) ) [  1 ]
( map (1+) . filter ((-1)<) ) [  0 ]
( map (1+) . filter ((-1)<) ) [ -1 ]

( map (+1) . filter (>=0) ) [  1 ]
( map (+1) . filter (>=0) ) [  0 ]
( map (+1) . filter (>=0) ) [ -1 ]

( map (1+) . filter (>=0) ) [  1 ]
( map (1+) . filter (>=0) ) [  0 ]
( map (1+) . filter (>=0) ) [ -1 ]

( map (+1) . filter (0<=) ) [  1 ]
( map (+1) . filter (0<=) ) [  0 ]
( map (+1) . filter (0<=) ) [ -1 ]

( map (1+) . filter (0<=) ) [  1 ]
( map (1+) . filter (0<=) ) [  0 ]
( map (1+) . filter (0<=) ) [ -1 ]

-}
-- Result in each case is:
--
-- [ 2 ]
-- [ 1 ]
-- [   ]




