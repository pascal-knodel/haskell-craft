--
--
--
-----------------
-- Exercise 4.15.
-----------------
--
--
--
module E'4'15 where




data Season

 =   Spring
   | Summer
   | Autumn
   | Winter
   
   deriving Eq


data Temp

 =   Cold
   | Hot
   
   deriving ( Eq , Show , Ord )



weather :: Season -> Temp
weather season

                               -- |  season == Spring =  Cold
 |  season == Summer =  Hot
 
                               -- |  season == Autumn =  Cold
                               -- |  season == Winter =  Cold
 |         otherwise =  Cold



-- Other solution:


weather2 :: Season -> Temp
weather2 Summer = Hot
weather2 _      = Cold




