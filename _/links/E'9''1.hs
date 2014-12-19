--
--
--
----------------
-- Exercise 9.1.
----------------
--
--
--
module E'9''1 where



import Prelude hiding ( or ) 




fac :: Integer -> Integer
fac n

 |     n == 0 =  1
 |  otherwise =  n * fac ( n - 1 )



--      4 > 2  ||  ( fac ( -1 ) == 17 )
--  ~>  True   ||  ( fac ( -1 ) == 17 )
--  ~>  True




-- Note: Haskell is a lazy language.
--       The definition of a boolean or function could look like this:


or :: Bool -> Bool -> Bool
or True _ = True
or _    _ = False



-- GHCi> True `or` ( fac ( -1 ) == 17 )
-- True



--     4 > 2  &&  ( fac ( -1 ) == 17 )
-- ~>  True   &&  ( fac ( -1 ) == 17 )
-- exception: No termination.



-- Note: I wrote 'No termination' to indicate infinite recursion.
--       In practice, on a computer this results in consuming the
--       memory that the system provides the program with. Sooner
--       or later it causes a memory exception.


-- GHCi> fac ( -1 )
-- <interactive>: out of memory




