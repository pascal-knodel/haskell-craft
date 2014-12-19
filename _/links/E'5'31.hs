--
--
--
-----------------
-- Exercise 5.31.
-----------------
--
--
--
module E'5'31 where



import E'5'27
 ( 
   Book
 , Person
 , Database
 , books
 )

import Test.QuickCheck




-- Subchapter 5.1 (exercise relevant new definitions) ...

makeLoan   :: Database -> Person -> Book -> Database
makeLoan dBase pers bk =  [ ( pers , bk ) ] ++ dBase


-- ...



prop_531 :: Database -> (Person, Book) -> (Person, Book) -> Bool 
prop_531 database ( bk , pers ) ( bk2 , pers2 )

 =  if (not (bk `elem` loanedBeforeLoan))
    then ( (bk `elem` loanedAfterLoan) == False )
    else (True)

 where

 loanedBeforeLoan :: [Book]
 loanedBeforeLoan =  books database pers

 afterLoan :: Database
 afterLoan =  makeLoan database pers2 bk2

 loanedAfterLoan :: [Book]
 loanedAfterLoan =  books afterLoan pers


-- GHCi> quickCheck prop_531
-- *** Failed! Falsifiable (after 1 test):
-- []
-- ( "" , "" )
-- ( "" , "" )




