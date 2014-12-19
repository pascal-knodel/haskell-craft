--
--
--
-----------------
-- Exercise 5.34.
-----------------
--
--
--
module E'5'34 where



import E'5'27
 ( 
   Book
 , Person
 , Database
 , books
 , exampleDB
 )
import E'5'28 ( borrowers )




borrowersString :: Database -> Book -> String
borrowersString database book

 =     "\n\t"
    ++ "Borrowers of the book \"" ++ book ++ "\":\n\n"
    ++ [   currentCharacter
         | currentBorrower <- borrowersList,
         currentCharacter <- ("\t" ++ currentBorrower ++ "\n") ]
    ++ "\n"
 
 where
 
 borrowersList :: [Person]
 borrowersList =  borrowers database book


{- GHCi>

putStr (borrowersString exampleDB "Tintin")

-}
--
--      Borrowers of the book "Tintin":
--
--      Alice
--      Rory
--



booksString :: Database -> Person -> String
booksString database person

 =     "\n\t"
    ++ "Books borrowed by \"" ++ person ++ "\":\n\n"
    ++ [   currentCharacter
         | currentBook <- bookList,
           currentCharacter <- ("\t" ++ currentBook ++ "\n") ]
    ++ "\n"
 
 where
 
 bookList :: [Book]
 bookList =  books database person


{- GHCi>

putStr (booksString exampleDB "Alice")

-}
--
--       Books borrowed by "Alice":
--
--       Tintin
--       Asterix
--




