--
--
--
----------------
-- Exercise 5.9.
----------------
--
--
--
module E'5''9 where



-- GHCi> :i show
-- class Show a where
--   ...
--   show :: a -> String
--   ...
--         -- Defined in `GHC.Show'


-- ghci "Chapter 4/C4"

-- *C4> show Rock
-- "R"

-- *C4> show Paper
-- "P"

-- *C4> show Scissors
-- "S"

-- There is an "instance declaration" of show in C4.hs, 
-- where the show function is defined.


-- ghci "Chapter 5/C5"

-- *C5> show (Circle 0)
-- "Circle 0.0"

-- *C5> show (Rectangle 0 0)
-- "Rectangle 0.0 0.0"

-- *C5> show (Triangle 0 0 0)
-- "Triangle 0.0 0.0 0.0"

-- The constructor name and its current arguments are converted to a string.
-- Read the documentation about the default "show" implementation.




