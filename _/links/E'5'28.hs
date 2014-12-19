--
--
--
-----------------
-- Exercise 5.28.
-----------------
--
--
--
module E'5'28 where



import E'5'27
 ( 
   Book
 , Person
 , Database
 , books
 )




borrowers :: Database -> Book -> [Person]
borrowers database book

 =  [   currentPerson | ( currentPerson , currentBook ) <- database ,
                        currentBook == book                           ]


{- GHCi>

borrowers exampleDB "Tintin"

-}
-- ["Alice", "Rory"]



isBorrowed :: Database -> Book -> Bool
isBorrowed database book

 |  loanedBookExamples /= []  = True
 |  otherwise                 = False
         
 where
         
 loanedBookExamples :: [Book]
 loanedBookExamples  = [   currentBook | ( _ , currentBook ) <- database ,
                                         currentBook == book               ]


{- GHCi>

isBorrowed exampleDB "Tintin"

-}
-- True



numBorrowed :: Database -> Person -> Integer
numBorrowed database person

 =  toInteger ( length (books database person) )


{- GHCi>

numBorrowed exampleDB "Alice"

-}
-- 2




