--
--
--
-----------------
-- Exercise 4.33.
-----------------
--
--
--
module E'4'33 where



import E'4'34 ( allEqual )  -- Don't look at the solution (black box testing).

import Test.HUnit




-- 1: Three equal
testAllEqual1 =  TestCase ( assertEqual "for: allEqual 0 0 0" True  (allEqual 0 0 0) )

-- 2: Three different
testAllEqual2 =  TestCase ( assertEqual "for: allEqual 0 1 2" False (allEqual 0 1 2) )

-- 3-5: Two different (case 1-3/3)
testAllEqual3 =  TestCase ( assertEqual "for: allEqual 0 0 1" False (allEqual 0 0 1) ) 
testAllEqual4 =  TestCase ( assertEqual "for: allEqual 0 1 0" False (allEqual 0 1 0) )
testAllEqual5 =  TestCase ( assertEqual "for: allEqual 1 0 0" False (allEqual 1 0 0) )


testsAllEqual 

 =  TestList
 [
   testAllEqual1,
   testAllEqual2,
   testAllEqual3,
   testAllEqual4,
   testAllEqual5
 ]

-- GHCi> runTestTT testsAllEqual




