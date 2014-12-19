--
--
--
-----------------
-- Exercise 3.20.
-----------------
--
--
--
module E'3'20 where




averageThree :: Integer -> Integer -> Integer -> Float
averageThree a b c

 =  ( fromIntegral ( a + b + c ) ) / 3



howManyAboveAverage :: (Float -> Float -> Float -> Float -> Integer) -> Integer -> Integer -> Integer -> Integer
howManyAboveAverage solution a b c

 =  solution ( averageThree a  b  c )
             ( fromIntegral a       )
             ( fromIntegral    b    )
             ( fromIntegral       c )



solution1 :: Float -> Float -> Float -> Float -> Integer
solution1 avg a b c

 |    a == b  &&  b == c       = 0   -- None above.

  -- |      a > avg  &&  b <= avg  &&  c <= avg
  --    ||  b > avg  &&  a <= avg  &&  c <= avg
  --    ||  c > avg  &&  a <= avg  &&  b <= avg   = 1   -- One above.

 |       a > avg  &&  b > avg
    ||   a > avg  &&  c > avg
    ||   b > avg  &&  c > avg  = 2   -- Two above.

 | otherwise                   = 1   -- One above.



solution2 :: Float -> Float -> Float -> Float -> Integer
solution2 avg a b c

 =    ( if ( a > avg ) then 1 else 0 )
    + ( if ( b > avg ) then 1 else 0 )
    + ( if ( c > avg ) then 1 else 0 )

-- Note: Don't forget the brackets, surrounding the if function.




{- GHCi>

averageThree 1 2 3
howManyAboveAverage solution1 1 2 3
howManyAboveAverage solution2 1 2 3

-}
-- 2.0
-- 1
-- 1




