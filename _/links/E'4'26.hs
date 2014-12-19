--
--
--
-----------------
-- Exercise 4.26.
-----------------
--
--
--
module E'4'26 where



import PicturesSVG ( Picture , above )



 
column :: Picture -> Integer -> Picture
column picture repetitions

 |  repetitions == 1 =  picture
 |  otherwise        =           picture 
                        `above`  column picture ( repetitions - 1 )




