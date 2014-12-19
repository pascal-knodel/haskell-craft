--
--
--
-----------------
-- Exercise 10.5.
-----------------
--
--
--
module E'10''5 where



-- Effect of "filter greaterOne ( filter lessTen numbers )":
-- ---------------------------------------------------------


-- First it filters all numbers that are lesser than ten out of "numbers".
-- Then it filters all numbers greater than one out of the result of the 
-- previous filter application.
--
-- Effect: The result contains numbers that are greater than one and
--         lesser than ten only.


{-

:{
   let lessTen :: ( Num t , Ord t ) => t -> Bool ;
       lessTen number = number < 10
:}

:{
   let greaterOne :: ( Num t , Ord t ) => t -> Bool ;
       greaterOne number = number > 1
:}

:{
   let numbers :: [Integer] ;
       numbers = [ 1 , 2 ]
:}

filter lessTen numbers
filter greaterOne it

-}
-- [ 1 , 2 ]
-- [ 2 ]




-- Property of "filter p ( filter q xs )":
-- ---------------------------------------


-- ---------------
-- 1. Proposition:
-- ---------------
--
--   filter s ( filter t us ) = filter t ( filter s us )
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
--     (Base case 1.)  :<=>  us := []
--     
--       =>  (left) := filter s ( filter t us )
--                                                 | (Base case 1.)
--                   = filter s ( filter t [] )
--                                                 | filter
--                   = filter s []
--                                                 | filter
--                   = []
--
--
--          (right) := filter t ( filter s us )
--                                                 | (Base case 1.)
--                   = filter t ( filter s [] )
--                                                 | filter
--                   = filter t []
--                                                 | filter
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
--    For an arbitrary, but fixed list "us", the statement ...
--
--      filter s ( filter t us ) = filter t ( filter s us )
--
--    ... holds.
--
--
--  1. Induction Step (1. I.S.):
--  ----------------------------
--
--
--     (left) := filter s ( filter t ( u : us ) )
--                                                                                                     | filter
--             = filter s ( filter t us ) ∨ filter s ( u : filter t us ) 
--                                                                                                     | filter
--             = filter s ( filter t us ) ∨ filter s ( filter t us ) ∨ u : filter s ( filter t us )
--                                                                                                     | (1. I.H.)
--             = filter t ( filter s us ) ∨ filter t ( filter s us ) ∨ u : filter t ( filter s us )
--
--
--    (right) := filter t ( filter s ( u : us ) )
--                                                                                                     | filter
--             = filter t ( filter s us ) ∨ filter t ( u : filter s us ) 
--                                                                                                     | filter
--             = filter t ( filter s us ) ∨ filter t ( filter s us ) ∨ u : filter t ( filter s us )
--
--
--    =>  (left) = (right)
--
--    ■  (1. Proposition)




