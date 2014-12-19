--
--
--
-----------------
-- Exercise 6.32.
-----------------
--
--
--
module E'6'32 where



import B'C'6 ( Image )

import E'6''7 ( printPicture )




printImage :: Image -> IO ()
printImage (picture , _)

 =  printPicture picture



 
-- Other solution for "printImage":



printImage2 :: Image -> IO ()
printImage2 image

 =  printPicture (fst image)




