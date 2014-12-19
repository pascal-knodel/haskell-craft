--
--
--
----------------
-- Exercise 5.5.
----------------
--
--
--
module E'5''5 where



data Shape
 =    Circle Float
   |  Rectangle Float Float
   |  Triangle Float Float Float -- Added after exercise 5.7.
    deriving ( {- Eq, -- Removed after exercise 5.10. -} Ord , Show )


perimeter :: Shape -> Float

perimeter (Circle r) =  2 * Prelude.pi * r

perimeter (Rectangle a b) =  2 * (a + b)

   -- Added after exercise 5.7.
  
perimeter (Triangle a b c) =  a + b + c


{- GHCi>

perimeter (Circle  1)
perimeter (Rectangle 1 1)
perimeter (Triangle 1 1 1)

-}
-- 6.2831855
-- 4.0
-- 3.0



-- Ex. 5.10. (ignore it for ex. 5.5.).


instance Eq Shape

 where

 (Circle a) == (Circle b)  =        a  == b
                              ||  (-a) == b

 (Rectangle a b) == (Rectangle c d)  =     ( perimeter (Rectangle a b) )
                                        == ( perimeter (Rectangle c d) )




