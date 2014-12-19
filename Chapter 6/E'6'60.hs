--
--
--
-----------------
-- Exercise 6.60.
-----------------
--
--
--
module E'6'60 where



import E'6'55 ( Player )
import E'6'59 ( Hand )




data HandsType =  Hands Player Hand   -- Lead.
                        Player Hand
                        Player Hand
                        Player Hand
                       
                  deriving ( Read , Show )




-- Other solution for "HandsType":



type Hands2 =  [ (Player , Hand) ]




