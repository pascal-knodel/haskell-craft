--
--
--
------------------
-- Exercise 10.31.
------------------
--
-- 
--
module E'10'31 where



-- import Pictures ( Picture )




type Picture =  [[Char]]   -- From Pictures.hs.


rotate90 :: Picture -> Picture
rotate90 [        ] = []
rotate90 ( [] : _ ) = []
rotate90 picture

 =  reverse ( map head picture ) : rotate90 ( map tail picture )


{- GHCi>

import Pictures

printPicture horse

printPicture ( rotate90 horse )

-}




