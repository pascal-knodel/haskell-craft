--
--
--
---------------------------------------
-- Quick Check Convenience Function(s).
---------------------------------------
--
--
--
module QCC where



import Test.QuickCheck




-- Run an arbitrary number of QuickCheck tests on a property with:


quickCheckN n =  quickCheckWith $ stdArgs { maxSuccess = n }


-- GHCi> quickCheckN <Number of tests> prop_... 




