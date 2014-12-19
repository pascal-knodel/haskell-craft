--
--
--
----------------
-- Exercise 4.6.
----------------
--
--
--
module E'4''6 where



import PicturesSVG   -- From Craft3e-0.1.0.10 package, see:
                     -- http://www.haskellcraft.com/craft3e/Start.html
 (
   Picture
 , above
 , flipV
 , invertColour
 , beside
 , render
 , horse
 )




fourPics3 :: Picture -> Picture
fourPics3 pic

 =  top `above` bottom
 
 where
 
 top, bottom :: Picture
                   
 top    =  pic `beside` ( invertColour ( flipV pic ) )
 
 bottom =  ( invertColour pic ) `beside` ( flipV pic )



fourPics4 :: Picture -> Picture
fourPics4 pic

 =  top `above` bottom
 
 where
 
 top, bottom :: Picture
 
 top    =  pic `beside` ( invertColour ( flipV pic ) )
 
 bottom =  flipV top



fourPics5 :: Picture -> Picture
fourPics5 pic

 =  top `above` bottom
 
 where
 
 stack :: Picture -> Picture
 stack pic =  pic `beside` invertColour ( flipV pic )
 
 top, bottom :: Picture
 
 top     =  stack pic
 
 bottom  =  stack ( invertColour pic )




