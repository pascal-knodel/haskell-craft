--
--
--
----------------
-- Exercise 9.2.
----------------
--
--
--
module E'9''2 where




mult :: Integer -> Integer -> Integer
mult 0    _     =  0
mult left right

 =  right + mult ( left - 1 ) right


{- GHCi>

mult 1 2
mult 2 2

-}
-- 2
-- 4


-- GHCi> mult 0 ( fact ( -2 ) )
-- 0

-- Explanation: the "right" argument is never evaluated because of the order
--              of arguments in the definition and Haskells laziness.


-- GHCi> mult ( fact ( -2 ) ) 0
-- <interactive>: out of memory

-- Explanation: this time the left argument is the first one to be evaluated.
--              "fact ( -2 )" never terminates and results in a memory exception.




