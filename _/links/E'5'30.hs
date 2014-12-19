--
--
--
-----------------
-- Exercise 5.30.
-----------------
--
--
--
module E'5'30 where



import E'5'27 ( Book , Person )




data Loan =  Loan Person Book
             deriving ( Eq , Show )
            

type Database' =  [Loan]


exampleDB' :: Database'
exampleDB'

 =  [ 
      Loan "Alice" "Tintin"       ,
      Loan "Anna"  "Little Women" ,
      Loan "Alice" "Asterix"      ,
      Loan "Rory"  "Tintin"
    ]


books' :: Database' -> Person -> [Book]
books' database person

 =  [ currentBook | (Loan currentPerson currentBook) <- database , currentPerson == person ]

 
{- GHCi>

books' exampleDB' "Alice"

-}
-- [ "Tintin" , "Asterix" ]



makeLoan' :: Database' -> Person -> Book -> Database'
makeLoan' database person book

 =  [ (Loan person book) ] ++ database


{- GHCi>

makeLoan' exampleDB' "Alice" "Little Women"

-}
-- [
--    Loan "Alice" "Little Women" ,
--    Loan "Alice" "Tintin"       ,
--    Loan "Anna"  "Little Women" ,
--    Loan "Alice" "Asterix"      ,
--    Loan "Rory"  "Tintin"
--  ]



returnLoan' :: Database' -> Person -> Book -> Database'
returnLoan' database person book

 =  [ currentPair | currentPair <- database , currentPair /= (Loan person book) ]


{- GHCi>

returnLoan' exampleDB' "Alice" "Tintin"

-}
-- [
--    Loan "Anna"  "Little Women" ,
--    Loan "Alice" "Asterix"      ,
--    Loan "Rory"  "Tintin"
--  ]




