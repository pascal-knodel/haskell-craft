--
--
--
------------------
-- Exercise 10.33.
------------------
--
-- 
--
module E'10'33 where




type Person =  String
type Book   =  String


type Database =  [  ( Person , [Book] )  ]


-- Example database ...


db :: Database
db

 =  [
      ( "Alice"  , [ "Tintin" , "Asterix" ] ) ,
      ( "Anna"   , [       "Little Women" ] ) ,
      ( "Pascal" , [                      ] ) ,
      ( "Rory"   , [             "Tintin" ] )
    ]


-- ...



books :: Database -> Person -> [Book]
books db "" =  error "No person."
books db person

 =  if ( record /= [] ) then ( snd ( head record  ) ) else []
 
 where
 
 record :: [(Person , [Book])]
 record =  filter isPerson db
 
 isPerson :: (Person , [Book]) -> Bool
 isPerson ( dbPerson , _ ) =  dbPerson == person


{- GHCi>

books db ""
books db "Alice"
books db "Anne"
books db "Pascal"

-}
-- *** Exception: No person.
-- [ "Tintin" , "Asterix" ]
-- []
-- []



borrowers :: Database -> Book -> [Person]
borrowers _  "" =  error "No book."
borrowers db book

 =  map fst ( filter isBorrower db )
 
 where
 
 isBorrower :: (Person , [Book]) -> Bool
 isBorrower ( person , books ) =  book `elem` books


{- GHCi>

borrowers db "Tintin"

-}
-- [ "Alice" , "Rory" ]



isBorrowed :: Database -> Book -> Bool
isBorrowed _  "" =  error "No book."
isBorrowed db book

 =  dropWhile isNotElem (  snd ( unzip db )  ) /= []
 
 where
 
 isNotElem :: [Book] -> Bool
 isNotElem books =  not ( book `elem` books )


{- GHCi>

isBorrowed db "Tintin"
isBorrowed db "HHGTTG"

-}
-- True
-- False



numBorrowed :: Database -> Person -> Int
numBorrowed _  "" =  error "No person."
numBorrowed db person

 =  length (  snd ( head (filter isPerson db) )  )
 
 where
 
 isPerson :: (Person, [Book]) -> Bool
 isPerson ( dbPerson , _ ) =  dbPerson == person


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

 =  map loan db
 
 where
 
 loan :: (Person , [Book]) -> (Person , [Book])
 loan ( dbPerson , dbBooks )
 
  |  dbPerson == person =  ( dbPerson , book : dbBooks )
  |           otherwise =  ( dbPerson ,        dbBooks )


{- GHCi>

makeLoan db "Pascal" "HHGTTG"

-}
-- [
--   ( "Alice"  , [ "Tintin" , "Asterix" ] ) ,
--   ( "Anna"   , [ "Little Women"       ] ) ,
--   ( "Pascal" , [ "HHGTTG"             ] ) ,
--   ( "Rory"   , [ "Tintin"             ] )
-- ]



returnLoan :: Database -> Person -> Book -> Database
returnLoan _  ""     _    =  error "No person."
returnLoan _  _      ""   =  error "No book."
returnLoan db person book

 =  map return db
 
 where
 
 return :: (Person , [Book]) -> (Person , [Book])
 return ( dbPerson , dbBooks )
 
  |  dbPerson == person =  ( dbPerson , filter isNotBook dbBooks )
  |           otherwise =  ( dbPerson , dbBooks )
 
 isNotBook :: Book -> Bool
 isNotBook dbBook =  dbBook /= book   -- Returns multiple (equal) loans.


{- GHCi>

returnLoan db "Alice" "Tintin"

-}
-- [
--   ( "Alice"  , [ "Asterix"      ] ) ,
--   ( "Anna"   , [ "Little Women" ] ) ,
--   ( "Pascal" , [                ] ) ,
--   ( "Rory"   , [ "Tintin"       ] )
-- ]




