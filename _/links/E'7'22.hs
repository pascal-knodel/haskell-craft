--
--
--
-----------------
-- Exercise 7.22.
-----------------
--
--
--
module E'7'22 where



import Test.QuickCheck




zip' :: ([a] , [b]) -> [ (a , b) ]
zip' (leftComponentList, rightComponentList)

 =  zip leftComponentList rightComponentList


prop_zip'_unzip :: ([Int] , [Int]) -> Bool -- zip' then unzip.
prop_zip'_unzip pairOfLists

 =  unzip (zip' pairOfLists) == pairOfLists


prop_unzip_zip' :: [ (Int , Int) ] -> Bool -- unzip then zip'.
prop_unzip_zip' pairOfLists

 =  zip' (unzip pairOfLists) == pairOfLists


{- GHCi>

quickCheck prop_zip'_unzip
quickCheck prop_unzip_zip'

-}


-- GHCi> quickCheck prop_zip'_unzip
-- *** Failed! Falsifiable (after 2 tests and 2 shrinks):
-- ([0] , [])


-- GHCi> quickCheck prop_unzip_zip'
-- +++ OK, passed 100 tests.


-- Yes, order is important (because zip' isn't bijective, that is because there exist different 
-- arguments that have the same result. "zip' ([] , []) == []" and "zip' ([_] , []) == []" is a 
-- counter-example that proves bijectivity wrong).
--
-- zip' is only a left inverse, unzip is only a right inverse in (zip' . unzip).
--
-- The argument to zip' is a pair of lists. If the list lengths differ, then zip' is not 
-- the right inverse. Information gets lost after zip' is applied to the argument, like I
-- showed in the example "zip' ([_] , []) == []". For two lists of equal length it is the 
-- inverse (left and right inverse) function.
--
-- Contrary to this, unzips argument is a list of pairs, if they split up ('unzip-like') it results 
-- always in a pair of lists of equal length. unzip is a right inverse function for zip'.




