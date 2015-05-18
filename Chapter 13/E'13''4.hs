--
--
--
-----------------
-- Exercise 13.4.
-----------------
--
--
--
module E'13''4 where



-- Note: Chapter 4> cabal install

import B'C'4
 (
   Move ( Rock , Paper , Scissors )
 )
import B'C'13
import E'6'53
 (
   CardType ( Card )
 , CardValue ( Ace )
 , Suit ( Hearts )
 )




-- "Move":
----------


instance Info Move where

 examples =  [Rock , Paper , Scissors]
 size _   =  1


-- GHCi> examples !! 0 == Rock
-- True

-- GHCi> head examples == Rock
-- True



-- Playing cards:
-----------------


instance Info CardType where

 examples = [Card Ace Hearts]
 size _   = 2



-- 'Triple types':
-------------------


instance (Info a , Info b , Info c) => Info (a , b , c) where

 examples         =  [ (x , y , z) | x <- examples , y <- examples , z <- examples ]
 size (x , y , z) =     size x  
                     +  size y
					 +  size z
					 +  1 


-- GHCi> size ('a', 'b', 'c')
-- 4

-- GHCi> size $ replicate 2 ('a', 'b', 'c')
-- 9
--
-- Note: "foldr (+) 1 . map size"




