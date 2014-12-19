--
--
--
----------------
-- Exercise 3.4.
----------------
--
--
--
module E'3''4 where



import Prelude hiding ( (&&) , (||) )




(&&) :: Bool -> Bool -> Bool
(&&) True True = True
(&&) True False = False
(&&) False True = False
(&&) False False = False



(||) :: Bool -> Bool -> Bool
(||) True True = True
(||) True False = True
(||) False True = True
(||) False False = False




