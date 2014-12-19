--
--
--
-----------------
-- Exercise 3.24.
-----------------
--
--
--
module E'3'24 where



import E'3'23 ( numberRoots )




smallerRoot, largerRoot :: Float -> Float -> Float -> Float

smallerRoot a b c

 |      0 == numberRoots a b c
    ||  3 == numberRoots a b c  = 0.0
 |      1 == numberRoots a b c
    ||  2 == numberRoots a b c  =   ( -( b + sqrt ( b^2 - 4.0 * a * c ) ) / 2 * a )
                                  * ( if ( a < 0 ) then ( -1 ) else 1 )
 
largerRoot a b c

 |      0 == numberRoots a b c
    ||  3 == numberRoots a b c  = 0.0
 |      1 == numberRoots a b c
    ||  2 == numberRoots a b c  =   ( ( ( -b ) + sqrt ( b^2 - 4.0 * a * c ) ) / 2 * a )
                                  * ( if ( a < 0 ) then ( -1 ) else 1 )



{- GHCi>

smallerRoot 1 0 ( -1 )
largerRoot 1 0 ( -1 )

-}
-- -1.0
--  1.0




