--
--
--
-----------------
-- Exercise 6.29.
-----------------
--
--
--
module E'6'29 where



import B'C'6
 (
   Position
 , Image
 )

import Pictures ( Picture )




makeImage :: Picture -> Position -> Image
makeImage picture position

 =  ( picture , position )




