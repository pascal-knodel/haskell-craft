--
--
--
-----------------
-- Exercise 9.11.
-----------------
--
--
--
module E'9'11 where



import Pictures

 (
   Picture
 , flipV
 , above
 )

import Test.QuickCheck

 (
   Property (..)
 , (==>)
 , Positive (..)
 , quickCheck
 , verboseCheck
 )




-- Ex. 9.4:


prop_AboveFlipV :: Picture -> Picture -> Bool
prop_AboveFlipV left right

 =  flipV ( left `above` right ) == ( flipV left ) `above` ( flipV right ) 


 
-- Ex. 9.5:


prop_SumPlusPlus :: [Integer] -> [Integer] -> Bool
prop_SumPlusPlus left right

 =  sum ( left ++ right ) == sum left + sum right



-- Ex. 9.6:


prop_PlusPlusEmpty :: (Eq t) => [t] -> Bool
prop_PlusPlusEmpty leftList

 =  leftList ++ [] == leftList


prop_PlusPlusAssociativity :: (Eq t) => [t] -> [t] -> [t] -> Bool
prop_PlusPlusAssociativity leftList middleList rightList

 =  leftList ++ ( middleList ++ rightList ) == ( leftList ++ middleList ) ++ rightList

 

-- Ex. 9.7:


prop_SumReverse :: [Integer] -> Bool
prop_SumReverse integerList

 =  sum ( reverse integerList ) == sum integerList


prop_LengthReverse :: [t]-> Bool
prop_LengthReverse list

 =  length ( reverse list ) == length list



-- Ex. 9.8:


prop_ElemPlusPlus :: Integer -> [Integer] -> [Integer] -> Bool
prop_ElemPlusPlus referenceItem leftList rightList

 =      elem referenceItem ( leftList ++ rightList ) == elem referenceItem leftList
    ||  elem referenceItem rightList



-- Ex. 9.9:


prop_ZipFstSndUnzip :: [ ( Integer , Integer ) ] -> Bool
prop_ZipFstSndUnzip pairs

 =  zip ( fst (unzip pairs) ) ( snd (unzip pairs) ) == pairs


propUnzipZip :: [Integer] -> [Integer] -> Property
propUnzipZip leftList rightList

 =      length leftList == length rightList
    ==> unzip ( zip leftList rightList ) == ( leftList , rightList )



-- Ex. 9.10:


prop_TakeDrop :: (Eq t) => (Positive Int) -> [t] -> Bool
prop_TakeDrop (Positive number) list

 =  take number list ++ drop number list == list



{- GHCi>


-- 9.4
quickCheck prop_AboveFlipV
-- 9.5
quickCheck prop_SumPlusPlus
-- 9.6
quickCheck prop_PlusPlusEmpty
quickCheck prop_PlusPlusAssociativity
-- 9.7
quickCheck prop_SumReverse
quickCheck prop_LengthReverse
-- 9.8
quickCheck prop_ElemPlusPlus
-- 9.9
quickCheck prop_ZipFstSndUnzip
quickCheck propUnzipZip
-- 9.10
quickCheck prop_TakeDrop


-}


-- Note: Use verboseCheck to show test data. The generation for "prop_TakeDrop" is not appropriate,
--       in example. Use QuickCheck preconditions, custom ranges or custom generators instead - 
--       test quality might improve in the order of these suggestions, it depends on you.




