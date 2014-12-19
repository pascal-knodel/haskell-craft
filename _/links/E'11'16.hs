--
--
--
------------------
-- Exercise 11.16.
------------------
--
--
--
module E'11'16 where



import Test.QuickCheck




prop_uncurryZip :: [Bool] -> [Bool] -> Property
prop_uncurryZip leftList rightList

 =       length leftList == length rightList   -- (-- 1)
                                             
    ==>  ( unzip $ (uncurry zip) (leftList , rightList) ) == (leftList , rightList)

-- GHCi> quickCheck prop_uncurryZip
-- *** Gave up! Passed only 50 tests.


-- Note: Not nice. I have the feeling the authors want us to suffer a little.
--       I guess, that it will be possible to define ELLs (Equal Lengths Lists) later.




-- Other solutions for "prop_uncurryZip":



prop_uncurryZip' :: ([Bool] , [Bool]) -> Property
prop_uncurryZip' lists

 =       length (fst lists) == length (snd lists)   -- (-- 1)
                                             
    ==>  ( unzip $ (uncurry zip) lists ) == lists

-- GHCi> quickCheck prop_uncurryZip'




