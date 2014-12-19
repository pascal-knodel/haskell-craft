--
--
--
-----------------
-- Exercise 3.12.
-----------------
--
--
--
module E'3'12 where



import E'3''8 ( integerNE )
import E'3''9 ( threeDifferent )
import E'3'10 ( fourEqual , fourEqual2 )




-- Ex. 3.8, "integerNE":


prop_integerNE :: Integer -> Bool   -- NE; Not Equal
prop_integerNE a

 =      ( integerNE   a         a         a       ) == False
    &&  ( integerNE   a         a       ( a + 1 ) ) == True
    &&  ( integerNE   a       ( a + 1 )   a       ) == True
    &&  ( integerNE ( a + 1 )   a         a       ) == True

-- GHCi> quickCheck prop_integerNE



-- Ex. 3.9, "threeDifferent":


prop_threeDifferent :: Integer -> Bool
prop_threeDifferent a

 =  ( threeDifferent a a a ) == False

-- GHCi> quickCheck prop_threeDifferent



-- Ex. 


prop_fourEqualAgainstFourEqual2 :: Integer -> Integer -> Integer -> Integer -> Bool
prop_fourEqualAgainstFourEqual2 a b c d

 =  fourEqual a b c d == fourEqual2 a b c d

-- GHCi> quickCheck prop_fourEqualAgainstFourEqual2




{- GHCi>

quickCheck prop_integerNE
quickCheck prop_threeDifferent
quickCheck prop_fourEqualAgainstFourEqual2

-}




