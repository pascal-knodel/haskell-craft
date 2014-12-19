--
--
--
-----------------
-- Exercise 5.27.
-----------------
--
--
--
module E'5'27 where




-- Subchapter 5.1 (exercise relevant definitions) ...

type Person =  String
type Book   =  String

type Database =  [ (Person , Book) ]

exampleDB :: Database
exampleDB

 =  [ 
       ( "Alice" , "Tintin"       ) , 
       ( "Anna"  , "Little Women" ) ,
       ( "Alice" , "Asterix"      ) ,
       ( "Rory"  , "Tintin"       )
    ]

books :: Database -> Person -> [Book]
books database person

 =  [ currentBook | (currentPerson, currentBook) <- database , currentPerson == person ]
  

-- ...



--   books exampleDB "Charlie"
-- = [ book | (person, book) <- exampleDB , person == "Charlie" ]
-- |
-- | person              =   "Alice"    "Anna"           "Alice"     "Rory"
-- | book                =   "Tintin"   "Little Women"   "Asterix"   "Tintin"
-- | person == "Charlie" =   False      False            False       False
-- | --------------------------------------------------------------------------
-- | book                =                                                   
-- |
-- = []


--   books exampleDB "Rory"
-- = [ book | (person, book) <- exampleDB , person == "Rory" ]
-- |
-- | person           =   "Alice"    "Anna"           "Alice"     "Rory"
-- | book             =   "Tintin"   "Little Women"   "Asterix"   "Tintin"
-- | person == "Rory" =   False      False            False       True
-- | -----------------------------------------------------------------------
-- | book             =                                           "Tintin"
-- |
-- = [ "Tintin" ]




