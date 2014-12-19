--
--
--
-----------------
-- Exercise 4.34.
-----------------
--
--
--
module E'4'34 where



allEqual :: Integer -> Integer -> Integer -> Bool
allEqual m n p

 =  (m + n + p) == 3 * p

-- GHCi> runTestTT testsAllEqual


-- But:
--
-- allEqual 0    2 1 
-- allEqual (-2) 4 1
-- ...
--
-- "Testing shows the presence, not the absence of bugs." (Edsger W. Dijkstra)




