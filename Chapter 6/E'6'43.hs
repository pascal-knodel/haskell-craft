--
--
--
-----------------
-- Exercise 6.43.
-----------------
--
--
--
module E'6'43 where



import B'C'6 ( Price )

import E'6'40 ( formatLine )




formatTotal :: Price -> String
formatTotal price

 =  "\n" ++ (  formatLine ( "Total" , price )  )




