--
--
--
-----------------
-- Exercise 4.38.
-----------------
--
--
--
module E'4'38 where



import E'4'32 ( powerTwo )

import Test.HUnit  




-- White box testing:


-- 1: Zero
-- 2: One
-- 3: Even
-- 4: Odd
testPowerTwo1 =  TestCase ( assertEqual "for: powerTwo 0" 1 (powerTwo 0) )
testPowerTwo2 =  TestCase ( assertEqual "for: powerTwo 1" 2 (powerTwo 1) )
testPowerTwo3 =  TestCase ( assertEqual "for: powerTwo 2" 4 (powerTwo 2) )
testPowerTwo4 =  TestCase ( assertEqual "for: powerTwo 3" 8 (powerTwo 3) )


testsPowertTwo

 =  TestList [
               testPowerTwo1 ,
               testPowerTwo2 ,
               testPowerTwo3 ,
               testPowerTwo4
             ]

-- GHCi> runTestTT testsPowertTwo




