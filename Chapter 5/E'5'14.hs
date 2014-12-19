--
--
--
-----------------
-- Exercise 5.14.
-----------------
--
--
--
module E'5'14 where



data House =     AlphaAddress String
              |  NumericAddress Int


instance Show House

 where
 
 show (AlphaAddress name)      = name
 show (NumericAddress number)  = show number



-- Other solution for "House":


data House' =  Address [Char] Int
             
instance Show House'

 where

 show (Address name number)
            
  |     name   == []
     && number >  0   = show number
	
  |     name   /= []
     && number <  0   = name
	
  |  otherwise        = "?"




