--
--
--
-----------------
-- Exercise 4.37.
-----------------
--
--
--
module E'4'37 where



import Test.HUnit  




-- Exercise 3.20 ...


averageThree :: Integer -> Integer -> Integer -> Float
averageThree i1 i2 i3

 =  ( fromIntegral (i1 + i2 + i3) ) / 3


howManyAboveAverage :: Integer -> Integer -> Integer -> Integer
howManyAboveAverage i1 i2 i3

 =  howManyAboveAverage' ( averageThree i1 i2 i3 )
                         ( fromIntegral i1       )
                         ( fromIntegral    i2    )
                         ( fromIntegral       i3 )
 
 where
 
 howManyAboveAverage' :: Float -> Float -> Float -> Float -> Integer
 howManyAboveAverage' avg f1 f2 f3
 
  |                    f1 == f2
                   &&  f2 == f3 =  0
 
  |      f1 > avg  &&  f2 > avg
     ||  f1 > avg  &&  f3 > avg
     ||  f2 > avg  &&  f3 > avg =  2
 
  |                   otherwise =  1


-- ...



-- 1: Zero above, all zero
-- 2: Zero above, all one
testHowManyAboveAverage1 =  TestCase ( assertEqual "for: howManyAboveAverage 0 0 0" 0 (howManyAboveAverage 0 0 0) )
testHowManyAboveAverage2 =  TestCase ( assertEqual "for: howManyAboveAverage 1 1 1" 0 (howManyAboveAverage 1 1 1) )

-- 3: Zero above, all positive
-- 4: One above, all positive
-- 5: Two above, all positive
testHowManyAboveAverage3 =  TestCase ( assertEqual "for: howManyAboveAverage 2 2 2" 0 (howManyAboveAverage 2 2 2) )
testHowManyAboveAverage4 =  TestCase ( assertEqual "for: howManyAboveAverage 0 1 2" 1 (howManyAboveAverage 0 1 2) )
testHowManyAboveAverage5 =  TestCase ( assertEqual "for: howManyAboveAverage 0 3 3" 2 (howManyAboveAverage 0 3 3) )

-- 6: One above, all negative
-- 7: One above, two negative integers
-- 8: Two above, all negative
testHowManyAboveAverage6 =  TestCase ( assertEqual "for: howManyAboveAverage (-1) (-1) (-1)" 0 (howManyAboveAverage (-1) (-1) (-1)) )
testHowManyAboveAverage7 =  TestCase ( assertEqual "for: howManyAboveAverage 0    (-4) (-2)" 1 (howManyAboveAverage 0    (-4) (-2)) )
testHowManyAboveAverage8 =  TestCase ( assertEqual "for: howManyAboveAverage (-5) (-2) (-2)" 2 (howManyAboveAverage (-5) (-2) (-2)) )


testsHowManyAboveAverage

 =  TestList
 [
   testHowManyAboveAverage1 ,
   testHowManyAboveAverage2 ,
   testHowManyAboveAverage3 ,
   testHowManyAboveAverage4 ,
   testHowManyAboveAverage5 ,
   testHowManyAboveAverage6 ,
   testHowManyAboveAverage7 ,
   testHowManyAboveAverage8
 ]

-- GHCi> runTestTT testsHowManyAboveAverage




