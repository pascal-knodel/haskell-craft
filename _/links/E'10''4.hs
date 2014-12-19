--
--
--
-----------------
-- Exercise 10.4.
-----------------
--
--
--
module E'10''4 where




-- Effect of "map addOne ( map addOne numbers )":
-- ----------------------------------------------


-- Applies "addOne" twice. First "numbers" is incremented,
-- then the result is incremented a again.
--
-- Effect: Adds two to any number in "numbers".



{- GHCi>

:{
   let addOne :: ( Num t , Ord t ) => t -> t ;
       addOne number = number + 1
:}

:{
   let numbers :: [Integer] ;
       numbers = [ 1 , 2 ]
:}

map addOne numbers
map addOne it        -- it = 'result of previous calculation'.

-}
-- [ 2 , 3 ]
-- [ 3 , 4 ]




-- Property of "map f ( map g xs )":
-- ---------------------------------


-- ---------------
-- 1. Proposition:
-- ---------------
--
--   map f ( map g xs ) = map g ( map f xs )
--
--   under the assumption that:
--
--     (Assumption 1.)  :<=>  f ( g x ) = g ( f x )
--
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
--       =>  (left) := map f ( map g xs )
--                                          | (Base case 1.)
--                   = map f ( map g [] )
--                                          | map
--                   = map f []
--                                          | map
--                   = []
--
--
--          (right) := map g ( map f xs )
--                                          | (Base case 1.)
--                   = map g ( map f [] )
--                                          | map
--                   = map g []
--                                          | map
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
--      map f ( map g xs ) = map g ( map f xs )
--
--    ... holds.
--
--
--  1. Induction Step (1. I.S.):
--  ----------------------------
--
--
--     (left) := map f ( map g ( x : xs ) )
--                                                    | map
--             = map f ( ( g x ) : map g xs )
--                                                    | map
--             = ( f ( g x ) ) : map f ( map g xs )
--                                                    | (1. I.H.)
--             = ( f ( g x ) ) : map g ( map f xs )
--
--
--    (right) := map g ( map f ( x : xs ) )
--                                                    | map
--             = map g ( ( f x ) : map f xs )
--                                                    | map
--             = ( g ( f x ) ) : map g ( map f xs )
--                                                    | (Assumption 1.)
--             = ( f ( g x ) ) : map g ( map f xs )
--
--
--    =>  (left) = (right)
--
--    ■  (1. Proposition)




