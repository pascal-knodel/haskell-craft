--
-- Chapter 13, definitions from the book.
--
module B'C'13 where



-- Note: Chapter 5> cabal install

import E'5''5
 (
   Shape ( Circle , Rectangle )
 )
import E'5''7
 (
   area
 )



class Info a where
 
 examples :: [a]
 size :: a -> Int


instance Info Char where

 examples =  [ 'a' , 'A' , 'z' , 'Z' , '0' , '9' ]
 size _   =  1

-- GHCi> putStr (examples !! 0)
--

-- GHCi> putStr (examples !! 1)
-- a

-- GHCi> examples :: [Char]
-- "aAzZ09"


instance Info Bool where

 examples =  [ True , False ]
 size _   =  1


instance Info Int where

 examples =  [ -100 .. 100 ]
 size _   =  1


-- instance Info Shape where
-- 
--  examples =  [ Circle 3.0 , Rectangle 45.9 87.6 ]
--  size _   =  round . area


instance Info a => Info [a] where

 examples =      [ [] ]
             ++  [ [x] | x <- examples ]
			 ++  [ [x,y] | x <- examples , y <- examples ]
 size     =  foldr (+) 1 . map size


instance (Info a , Info b) => Info (a , b) where

 examples     =  [ (x , y) | x <- examples , y <- examples ]
 size (x , y) =     size x  
                 +  size y
				 +  1 



--


class Checkable b where

 infoCheck :: (Info a) => (a -> b) -> Bool


instance Checkable Bool where
 
 infoCheck property = and (map property examples)  


instance (Info a, Checkable b) => Checkable (a -> b) where
 
 infoCheck property = and (map (infoCheck . property) examples) 

 
test0 =  infoCheck ( \x   -> ( x <= (0::Int) || x >  0             )  )
test1 =  infoCheck ( \x y -> ( x <= (0::Int) || y <= 0 || x*y >= x )  )
test2 =  infoCheck ( \x y -> ( x <= (0::Int) || y <= 0 || x*y > x  )  )




