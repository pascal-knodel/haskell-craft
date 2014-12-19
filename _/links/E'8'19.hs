--
--
--
-----------------
-- Exercise 8.19.
-----------------
--
--
--
module E'8'19 where



copy :: IO ()
copy

 =  do line <- getLine
       let whileCopy = do if   (line == "")
                          then (return () )
                          else (
                                 do putStrLn line
                                    line <- getLine
                                    whileCopy
                               )
       whileCopy


-- In the 'outermost' do-block a local definition "line" is introduced,
-- that holds a user-defined string.
-- Then a function named "whileCopy" is defined, which has another
-- 'inner' do-block. It contains an "if-function" which uses the ex-
-- pression "line" to compare it with the empty string "(line == "")".
-- The name "line" is bound to the definition in the 'outer' do-block.
-- That means, if the user-input is not the empty string "", this con-
-- dition is never "True". In the else-case is yet another do-block.
-- In its sequence it prints out the "line" which is bound to the 
-- 'outermost' do-block. After that it introduces its own name "line".
-- Because of single-assignment this name is only valid in the 
-- 'innermost' do-block. The call of "whileCopy" at the end of the
-- definition of "whileCopy" makes it a recursive definition, but:
-- at this point we are already stuck in an endless recursion.
-- If the user didn't abort with the empty string, he is trapped 
-- in the else-branch. Without care/knowledge introducing names in do-
-- blocks can lead to confusion and errors.




