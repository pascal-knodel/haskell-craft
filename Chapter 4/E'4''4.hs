--
--
--
----------------
-- Exercise 4.4.
----------------
--
--
--
module E'4''4 where




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



fourEqual :: Integer -> Integer -> Integer -> Integer -> Bool
fourEqual a b c d 

 |      ( threeEqual a b c )
    &&  a == d                = True
    
 |  otherwise                 = False



fourDifferent :: Integer -> Integer -> Integer -> Integer -> Bool
fourDifferent a b c d

 |      ( threeDifferent a b c )
    &&  a /= d
    &&  b /= d
    &&  c /= d                    = True
    
 |  otherwise                     = False



threeEqualOfFour :: Integer -> Integer -> Integer -> Integer -> Bool
threeEqualOfFour a b c d

 |      threeEqual   b c d
    ||  threeEqual a   c d
    ||  threeEqual a b   d
    ||  threeEqual a b c    = True

 |  otherwise               = False



howManyOfFourEqual :: Integer -> Integer -> Integer -> Integer -> Integer
howManyOfFourEqual a b c d

 |  fourEqual a b c d         = 4
 |  threeEqualOfFour a b c d  = 3   -- Note: "threeEqualOfFour" has to be second. If it would be first,
                                    --       it would also match every four equal.
 |  fourDifferent a b c d     = 1
 |  otherwise                 = 2   -- |  twoEqualOfFour a b c d  = 2




twoEqualOfFour :: Integer -> Integer -> Integer -> Integer -> Bool
twoEqualOfFour a b c d

 |      a == b  &&  c /= a  &&  d /= a
    ||  a == c  &&  b /= a  &&  d /= b
    ||  a == d  &&  b /= a  &&  c /= a
    ||  b == c  &&  a /= b  &&  d /= b
    ||  b == d  &&  a /= b  &&  c /= d
    ||  c == d  &&  a /= c  &&  b /= c  = True
 
 |  otherwise                           = False




