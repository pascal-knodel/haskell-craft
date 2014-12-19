--
--
--
-----------------
-- Exercise 4.36.
-----------------
--
--
--
module E'4'36 where




attempt :: Integer -> Integer -> Integer -> Bool
attempt m n p

 =      m /= n
    &&  n /= p


-- Test results:
--             
-- *C4> runTestTT testsAllDifferent
-- ### Failure in: 12
-- for: allDifferent 2 3 2
-- expected: False
--  but got: True
-- Cases: 14  Tried: 14  Errors: 0  Failures: 1
-- Counts {cases = 14, tried = 14, errors = 0, failures = 1}




