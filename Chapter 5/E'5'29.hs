--
--
--
-----------------
-- Exercise 5.29.
-----------------
--
--
--
module E'5'29 where



import E'5'27
 ( 
   Book
 , Person
 , Database
 )




-- Subchapter 5.1 (exercise relevant definitions) ...


returnLoan :: Database -> Person -> Book -> Database
returnLoan dBase pers bk

 =  [ pair | pair <- dBase , pair /= ( pers , bk ) ]
  

-- ...



--   returnLoan exampleDB "Alice" "Asterix"
-- = [ pair | pair <- exampleDB , pair /= ("Alice", "Asterix") ]
-- | 
-- | pair                         = ("Alice", "Tintin")   ("Anna", "Little Women")   ("Alice", "Asterix")   ("Rory", "Tintin")
-- | pair /= ("Alice", "Asterix") = True                  True                       False                  True
-- | -------------------------------------------------------------------------------------------------------------------------
-- | pair                         = ("Alice", "Tintin")   ("Anna", "Little Women")                          ("Rory", "Tintin")
-- |
-- = [ ("Alice", "Tintin"), ("Anna", "Little Women"), ("Rory", "Tintin") ]


--   returnLoan exampleDB "Alice" "Little Women"
-- = [ pair | pair <- exampleDB , pair /= ("Alice", "Little Women") ]
-- | 
-- | pair                         = ("Alice", "Tintin")   ("Anna", "Little Women")   ("Alice", "Asterix")   ("Rory", "Tintin")
-- | pair /= ("Alice", "Asterix") = True                  True                       True                   True
-- | -------------------------------------------------------------------------------------------------------------------------
-- | pair                         = ("Alice", "Tintin")   ("Anna", "Little Women")   ("Alice", "Asterix")   ("Rory", "Tintin")
-- |
-- = [ ("Alice", "Tintin"), ("Anna", "Little Women"), ("Alice", "Asterix"), ("Rory", "Tintin") ]




