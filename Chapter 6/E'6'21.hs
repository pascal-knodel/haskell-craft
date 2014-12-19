--
--
--
-----------------
-- Exercise 6.21.
-----------------
--
--
--
module E'6'21 where



import E'6''8 ( rotate90 )

import Pictures ( Picture )

import Data.List ( concat )




columnsToRows :: Picture -> Picture
columnsToRows picture -- "Column picture".

 =  map reverse (rotate90 picture)
 
 
-- printPicture --


printPicture'C :: Picture -> IO ()
printPicture'C picture -- "Column picture".

 =  putStr (  concat ( map (++ "\n") (columnsToRows picture) )  )


------------------




