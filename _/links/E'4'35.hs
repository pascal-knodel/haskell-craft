--
--
--
-----------------
-- Exercise 4.35.
-----------------
--
--
--
module E'4'35 where



import E'4'36 ( attempt )

import Test.HUnit   




allDifferent :: Integer -> Integer -> Integer -> Bool
allDifferent =  attempt


-- 1: All zero
-- 2: All one
testAllDifferent1  = TestCase ( assertEqual "for: allDifferent 0 0 0" False (allDifferent 0 0 0) ) 
testAllDifferent2  = TestCase ( assertEqual "for: allDifferent 1 1 1" False (allDifferent 1 1 1) )

-- 3-6: All different and positive (case 1-4/4)
testAllDifferent3  = TestCase ( assertEqual "for: allDifferent 2 3 4" True  (allDifferent 2 3 4) )
testAllDifferent4  = TestCase ( assertEqual "for: allDifferent 3 2 4" True  (allDifferent 3 2 4) )
testAllDifferent5  = TestCase ( assertEqual "for: allDifferent 4 3 2" True  (allDifferent 4 3 2) )
testAllDifferent6  = TestCase ( assertEqual "for: allDifferent 2 4 3" True  (allDifferent 2 4 3) )

-- 7-10: All different and one negative (case 1-4/4)
testAllDifferent7  = TestCase ( assertEqual "for: allDifferent (-2) 4 3" True  (allDifferent (-2) 4 3) )
testAllDifferent8  = TestCase ( assertEqual "for: allDifferent 3 (-2) 4" True  (allDifferent 3 (-2) 4) )
testAllDifferent9  = TestCase ( assertEqual "for: allDifferent 4 3 (-2)" True  (allDifferent 4 3 (-2)) )
testAllDifferent10 = TestCase ( assertEqual "for: allDifferent (-2) 4 3" True  (allDifferent (-2) 4 3) )

-- 11: All equal
testAllDifferent11 = TestCase ( assertEqual "for: allDifferent 2 2 2" False (allDifferent 2 2 2) )

-- 12-14: Two equal (case 1-3/3)
testAllDifferent12 = TestCase ( assertEqual "for: allDifferent 2 2 3" False (allDifferent 2 2 3) )
testAllDifferent13 = TestCase ( assertEqual "for: allDifferent 2 3 2" False (allDifferent 2 3 2) )
testAllDifferent14 = TestCase ( assertEqual "for: allDifferent 3 2 2" False (allDifferent 3 2 2) )


testsAllDifferent

 = TestList
 [
   testAllDifferent1  ,
   testAllDifferent2  ,
   testAllDifferent3  ,
   testAllDifferent4  ,
   testAllDifferent5  ,
   testAllDifferent6  ,
   testAllDifferent7  ,
   testAllDifferent8  ,
   testAllDifferent9  ,
   testAllDifferent10 ,
   testAllDifferent11 ,
   testAllDifferent12 ,
   testAllDifferent13 ,
   testAllDifferent14
 ]

-- GHCi> runTestTT testsAllDifferent




