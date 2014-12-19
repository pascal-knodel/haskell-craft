--
--
--
----------------
-- Exercise 4.7.
----------------
--
--
--
module E'4''7 where



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




fourPics6 :: Picture -> Picture
fourPics6 pic

 =          ( top_left    `beside` top_right    )
    `above` ( bottom_left `beside` bottom_right )
 
 where
 
 top_left, top_right, bottom_left, bottom_right :: Picture
 
 top_left     =  pic
 top_right    =  flipV ( invertColour pic )
 bottom_left  =  invertColour pic
 bottom_right =  flipV pic



fourPics7 :: Picture -> Picture
fourPics7 pic

 =  side `beside` flipV ( invertColour side )
 
 where
 
 side :: Picture
 side =  pic `above` ( invertColour pic )




