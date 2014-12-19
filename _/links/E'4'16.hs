--
--
--
-----------------
-- Exercise 4.16.
-----------------
--
--
--
module E'4'16 where



import E'4'15 ( Season ( Spring , Summer , Autumn , Winter ) )




data Month

 =   January
   | February
   | March
   | April
   | May
   | June
   | July
   | August
   | September
   | October
   | November
   | December
   
   deriving ( Eq , Show )




-- Pattern matching:
--------------------


isSpring , isSummer , isAutumn , isWinter :: Month -> Bool


isSpring March =  True
isSpring April =  True
isSpring May   =  True
isSpring _     =  False


isSummer June   =  True
isSummer July   =  True
isSummer August =  True
isSummer _      =  False


isAutumn September =  True
isAutumn October   =  True
isAutumn November  =  True
isAutumn _         =  False


isWinter December =  True
isWinter January  =  True
isWinter February =  True
isWinter _        =  False


monthToNHSeason :: Month -> Season -- Northern Hemisphere; NH
monthToNHSeason month

 |  isSpring month =  Spring
 |  isSummer month =  Summer
 |  isAutumn month =  Autumn
 |  otherwise      =  Winter   -- | isWinter month = Winter



-- Guards:
----------


isSpring2 , isSummer2 , isAutumn2 , isWinter2 :: Month -> Bool


isSpring2 month

 |     month == March
   ||  month == April
   ||  month == May   =  True
   
 |          otherwise =  False


isSummer2 month

 |      month == June
    ||  month == July
    ||  month == August  =  True
    
 |             otherwise =  False


isAutumn2 month

 |      month == September
    ||  month == October
    ||  month == November  =  True
    
 |               otherwise =  False


isWinter2 month

 |      month == December
    ||  month == January
    ||  month == February =  True
    
 | otherwise              =  False


monthToNHSeason2 :: Month -> Season -- Northern Hemisphere; NH
monthToNHSeason2 month

 |  isSpring2 month =  Spring
 |  isSummer2 month =  Summer
 |  isAutumn2 month =  Autumn
 |  otherwise      =  Winter   -- | isWinter2 month = Winter




