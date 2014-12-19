--
--
--
-----------------
-- Exercise 5.12.
-----------------
--
--
--
module E'5'12 where



import E'5'11 (  NewShape ( NewCircle , NewRectangle , NewTriangle )  )




move :: Float -> Float -> NewShape -> NewShape
move x y (  NewCircle r ( posX , posY )  )       =  NewCircle r ( posX + x , posY + y )
move x y (  NewRectangle a b ( posX , posY )  )  =  NewRectangle a b ( posX + x , posY + y )
move x y (  NewTriangle a b c ( posX , posY )  ) =  NewTriangle a b c ( posX + x , posY + y )


{- GHCi>

move 1 1 (  NewCircle 1 ( 0 , 0 )  )
move 1 1 (  NewRectangle 1 1 ( 0 , 0 )  )
move 1 1 (  NewTriangle 1 1 1 ( 0 , 0 )  )

-}
-- NewCircle 1.0 ( 1.0 , 1.0 )
-- NewRectangle 1.0 1.0 ( 1.0 , 1.0 )
-- NewTriangle 1.0 1.0 1.0 ( 1.0 , 1.0 )




