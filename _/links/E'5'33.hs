--
--
--
-----------------
-- Exercise 5.33.
-----------------
--
--
--
module E'5'33 where



import E'5'27
 ( 
   Book
 , Person
 )
import E'5'32 ( Database'' , makeLoan'' , books'' , returnLoan'' )




-- Subchapter 5.1 (exercise relevant definitions) ...


prop_db1 :: Database'' -> Person -> Book -> Bool
prop_db1 dBase pers bk
 
 =  (bk `elem` loanedAfterLoan) == True
         
 where
         
 afterLoan = makeLoan'' dBase pers bk
 loanedAfterLoan = books'' afterLoan pers

-- GHCi> quickCheck prop_db1


prop_db2 :: Database'' -> Person -> Book -> Bool
prop_db2 dBase pers bk

 =  (bk `elem` loanedAfterReturn) == False
 
 where
 
 afterReturn = returnLoan'' dBase pers bk
 loanedAfterReturn = books'' afterReturn pers

-- GHCi> quickCheck prop_db2


-- ...


-- The test logic doesn't change (only the types, the '' wouldn't be there 
-- if we would only use the implementation of exercise 5.32).




