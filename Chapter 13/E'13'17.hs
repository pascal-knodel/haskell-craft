--
--
--
------------------
-- Exercise 13.17.
------------------
--
--
--
module E'13'17 where



{- GHCi>

:t 37
:t True

-}
-- 37 :: Num a => a
--
-- True :: Bool



---------------------------
-- f n     =  37 + n   -- 1
-- f True  =  34       -- 2
---------------------------
--
-- I see an ambiguity in the argument type: in the first line the argument "n" is used in a numeric context
-- and in the second line the argument is a boolean "True".


{- GHCi> 


:{
let f n     =  37 + n
    f True  =  34
:}


-}
-- 
-- <interactive>:3:19:
--     No instance for (Num Bool) arising from a use of `+'
--     In the expression: 37 + n
--     In an equation for `f': f n = 37 + n



----------------------
-- g 0  =  37     -- 1
-- g n  =  True   -- 2
----------------------
--
-- I see an ambiguity in the return type. In the first line it is numeric "37"
-- and in the second line it is a boolean "True".


{- GHCi>


:{
let g 0  =  37
    g n  =  True
:}


-}
--
-- <interactive>:3:13:
--     Could not deduce (Num Bool) arising from the literal `37'
--     from the context (Num a, Eq a)
--       bound by the inferred type of g :: (Num a, Eq a) => a -> Bool
--       at <interactive>:(3,5)-(4,16)
--     In the expression: 37
--     In an equation for `g': g 0 = 37



--------------------------------
-- h x                      -- 1
--   |  x > 0      = True   -- 2
--   |  otherwise  = 37     -- 3
--------------------------------
--
-- I see an ambiguity in the clause return type: in the second line it is a boolean "True"
-- and in the third line it is a numeric "37".


{- GHCi>


:{
let h x
      |  x > 0      = True
      |  otherwise  = 37
:}


-}
--
-- <interactive>:5:23:
--     Could not deduce (Num Bool) arising from the literal `37'
--     from the context (Ord a, Num a)
--       bound by the inferred type of h :: (Ord a, Num a) => a -> Bool
--       at <interactive>:(3,5)-(5,24)
--     In the expression: 37
--     In an equation for `h':
--         h x
--           | x > 0 = True
--           | otherwise = 37



--------------------
-- k x  =  34   -- 1
-- k 0  =  35   -- 2
--------------------
--
-- I see an ambiguity in the pattern definitions: the first pattern will consume everything.
-- Thats why the second pattern becomes useless.


{- GHCi>


:{
let k x  =  34
    k 0  =  35
:}


-}
-- 
-- <interactive>:3:5: Warning:
--     Pattern match(es) are overlapped
--     In an equation for `k': k 0 = ...




