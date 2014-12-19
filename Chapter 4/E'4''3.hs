--
--
--
----------------
-- Exercise 4.3.
----------------
--
--
--
module E'4''3 where



import Test.QuickCheck ( quickCheck )




-- From subchapter 3.2, Relational operators (example):


threeEqual :: Integer -> Integer -> Integer -> Bool
threeEqual a b c

 |      a == b
    &&  b == c  = True
    
 |  otherwise   = False


-- Exercise 3.9 (its solution):


threeDifferent :: Integer -> Integer -> Integer -> Bool
threeDifferent a b c 

 |      a /= b
    &&  a /= c
    &&  b /= c  = True
    
 |  otherwise   = False


-- ...



twoEqualOfThree :: Integer -> Integer -> Integer -> Bool
twoEqualOfThree a b c

 |      a == b
    ||  a == c
    ||  b == c  = True
    
 |  otherwise   = False



howManyEqual :: Integer -> Integer -> Integer -> Integer
howManyEqual {- Of three numbers -} a b c
           
 |  threeEqual a b c      = 3
 |  threeDifferent a b c  = 1
 |  otherwise             = 2    -- |  twoEqualOfThree a b c  = 2



prop_countEqual_3_3 :: Integer -> Bool
prop_countEqual_3_3 a

 =  howManyEqual a a a == 3

-- GHCi> quickCheck prop_countEqual_3_3


prop_countEqual_2_3 :: Integer -> Bool
prop_countEqual_2_3 a

 =  howManyEqual a a ( a + 1 ) == 2

-- GHCi> quickCheck prop_countEqual_2_3


prop_countEqual_1_3 :: Integer -> Bool
prop_countEqual_1_3 a

 =  howManyEqual a ( a + 1 ) ( a + 2 ) == 1

-- GHCi> quickCheck prop_countEqual_1_3



{- GHCi>

quickCheck prop_countEqual_3_3
quickCheck prop_countEqual_2_3
quickCheck prop_countEqual_1_3

-}




-- Better: Unit testing.




