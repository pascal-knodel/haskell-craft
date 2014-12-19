--
--
--
-----------------
-- Exercise 5.32.
-----------------
--
--
--
module E'5'32 where



import E'5'27
 ( 
   Book
 , Person
 )




type Database'' =  [(Person, [Book])]


exampleDB'' :: Database''
exampleDB''

 = [ 
     ( "Alice" , ["Tintin", "Asterix"] ) ,
     ( "Anna"  , ["Little Women"]      ) ,
     ( "Rory"  , ["Tintin"]            )
   ]
             
             
bookListsListToList :: [[Book]] -> [Book]
bookListsListToList bookListsList

 =  [ currentBook | bookList <- bookListsList, currentBook <- bookList ]


{- GHCi>

bookListsListToList [ ["A"] ,["B"] ]

-}
-- [ "A" , "B" ]



books'' :: Database'' -> Person -> [Book]
books'' database person

 =  bookListsListToList bookListList
          
 where
          
 bookListList :: [[Book]]
 bookListList =  [ bookList | ( currentPerson , bookList ) <- database, currentPerson == person ]


{- GHCi>

books'' exampleDB'' "Alice"

-}
-- [ "Tintin", "Asterix" ]



makeLoan'' :: Database'' -> Person -> Book -> Database''
makeLoan'' database person book

 |  not (person `elem` persons)  =     database
                                    ++ [(person, [book])]
                                           
 |  otherwise                    =     personLoaned
                                    ++ other

 where
 
 persons :: [Person]
 persons =  [ currentPerson | (currentPerson, _) <- database ]
           
 personLoaned :: [(Person, [Book])]
 personLoaned =  [   ( currentPerson , currentBookList ++ [book] )
                   | ( currentPerson , currentBookList ) <- database,
                     currentPerson == person                       ]
           
 other :: [(Person, [Book])]
 other = [   ( currentPerson , currentBookList )
           | (currentPerson, currentBookList) <- database,
             currentPerson /= person                       ]


{- GHCi>

makeLoan'' exampleDB'' "Alice" "New Book"

-}
-- [
--   ( "Alice" , ["Tintin", "Asterix" , "New Book"] ) , 
--   ( "Anna"  , ["Little Women"]                   ) ,
--   ( "Rory"  , ["Tintin"]                         )
-- ]


returnLoan'' :: Database'' -> Person -> Book -> Database''
returnLoan'' database person book

 =     personReturned
    ++ other
 
 where
 
 bookListsList :: [[Book]]
 bookListsList =  [   currentBookList
                    | (currentPerson, currentBookList) <- database,
                      currentPerson == person                        ]
 
 bookReturned :: [Book]
 bookReturned =  [   currentBook
                   | currentBook <- (bookListsListToList bookListsList),
                     currentBook /= book                                 ]
 
 personReturned :: [(Person, [Book])]
 personReturned =  [   ( currentPerson , bookReturned )
                     | ( currentPerson , _ ) <- database,
                       currentPerson == person            ]
 
 other :: [(Person, [Book])]
 other =  [   ( currentPerson , currentBookList )
            | ( currentPerson , currentBookList ) <- database,
              currentPerson /= person                       ]


{- GHCi>

returnLoan'' exampleDB'' "Alice" "Tintin"

-}
-- [
--   ( "Alice" , ["Asterix"]      ) ,
--   ( "Anna"  , ["Little Women"] ) ,
--   ( "Rory"  , ["Tintin"]       )
-- ]


-- Note: I didn't use higher order functions, because this represents the
--       solution if you chose a linear approach (reading the book, starting 
--       at the first and ending with the last page) and not using materials 
--       or knowledge (you might already have) to ease the pain. It feels like 
--       this is the authors intention. If you do this, you note lots of subtleties. 
--       Its training your thinking (and your eyes) to spot lots of problems in an
--       very early state of development. 




