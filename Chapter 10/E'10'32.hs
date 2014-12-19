--
--
--
------------------
-- Exercise 10.32.
------------------
--
-- 
--
module E'10'32 where




-- From subchapter 5.1 ...


type Person =  String
type Book   =  String

type Database =  [ (Person , Book) ]


-- Example database ...


db :: Database
db

 =  [ 
      ( "Alice" , "Tintin"       ) , 
      ( "Anna"  , "Little Women" ) ,
      ( "Alice" , "Asterix"      ) ,
      ( "Rory"  , "Tintin"       )
    ]


-- ...




books :: Database -> Person -> [Book]
books _  "" =  error "No person."
books db person

 =  map snd ( filter isPerson db )
 
 where
 
 isPerson :: (Person , Book) -> Bool
 isPerson ( dbPerson , _ ) =  dbPerson == person


{- GHCi>

books db ""
books db "Alice"
books db "Pascal"

-}
-- *** Exception: No person.
-- [ "Tintin" , "Asterix" ]
-- []



borrowers :: Database -> Book -> [Person]
borrowers _  "" =  error "No book."
borrowers db book

 =  map fst ( filter isBook db )
 
 where
 
 isBook :: (Person , Book) -> Bool
 isBook ( _ , dbBook ) =  dbBook == book


{- GHCi>

borrowers db "Tintin"

-}
-- [ "Alice" , "Rory" ]



isBorrowed :: Database -> Book -> Bool
isBorrowed _  "" =  error "No book."
isBorrowed db book

 =  book `elem` snd ( unzip db )


{- GHCi>

isBorrowed db "Tintin"
isBorrowed db "HHGTTG"

-}
-- True
-- False



numBorrowed :: Database -> Person -> Int
numBorrowed _  "" =  error "No person."
numBorrowed db person

 =  length ( books db person )


{- GHCi>

numBorrowed db "Alice"
numBorrowed db "Pascal"

-}
-- 2
-- 0



makeLoan :: Database -> Person -> Book -> Database
makeLoan _  ""     _    =  error "No person."
makeLoan _  _      ""   =  error "No book."
makeLoan db person book

 =  ( person , book ) : db


{- GHCi>

makeLoan db "Pascal" "HHGTTG"

-}
-- [
--   ( "Pascal" , "HHGTTG"       ) ,
--   ( "Alice"  , "Tintin"       ) , 
--   ( "Anna"   , "Little Women" ) ,
--   ( "Alice"  , "Asterix"      ) ,
--   ( "Rory"   , "Tintin"       )
-- ]



returnLoan :: Database -> Person -> Book -> Database
returnLoan _  ""     _    =  error "No person."
returnLoan _  _      ""   =  error "No book."
returnLoan db person book

 =  filter isNotLoan db
 
 where
 
 isNotLoan :: (Person , Book) -> Bool
 isNotLoan dbLoan =  dbLoan /= ( person , book )


{- GHCi>

returnLoan db "Alice" "Tintin"

-}
-- [ 
--   ( "Anna"   , "Little Women" ) ,
--   ( "Alice"  , "Asterix"      ) ,
--   ( "Rory"   , "Tintin"       )
-- ]




-- Other solutions ...


isBorrowed2 :: Database -> Book -> Bool
isBorrowed2 _  ""   =  error "No book."
isBorrowed2 db book

 =  any isBook db
 
 where
 
 isBook :: (Person , Book) -> Bool
 isBook ( _ , dbBook ) =  dbBook == book


{- GHCi>

isBorrowed2 db "Tintin"
isBorrowed2 db "HHGTTG"

-}
-- True
-- False




