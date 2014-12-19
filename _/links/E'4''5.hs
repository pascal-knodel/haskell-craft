--
--
--
----------------
-- Exercise 4.5.
----------------
--
--
--
module E'4''5 where



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




fourPics :: Picture -> Picture
fourPics pic

 =  left `beside` right
 
 where
 
 left, right :: Picture
                  
 left  =  pic `above` ( invertColour pic )
 
 right =  flipV ( ( invertColour pic ) `above` pic )




-- Other solution:


fourPics2 :: Picture -> Picture
fourPics2 pic

 =  left `beside` right
 
 where
 
 left, right :: Picture
                   
 left  =  invertColour ( flipV right )
 
 right =  flipV ( ( invertColour pic ) `above` pic )




-- Visualisation: Open C4.html in a browser.
--
-- Chapter 4\Visualisation\Shell> ghci "..\E'4''5"
--
-- GHCi> render ( fourPics horse )




