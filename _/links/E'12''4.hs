--
--
--
-----------------
-- Exercise 12.4.
-----------------
--
--
--
module E'12''4 where



import Pictures
 (
   Picture
 , width
 , height
 )




pictureToRep :: Picture -> ( Int , Int , [(Int , Int)] )
pictureToRep p   -- "p"; picture

 =  ( width p , height p , positions )
 
 where        -- "pe"; picture element, "ws"; widths
 
 positions =  [ (h , w) | (h , ws) <- (   zip [0 ..] . map (map fst) . map (  filter ( \(_ , pe) -> pe == '#' )  ) . map ( zip [0 ..] )   ) p , w <- ws ]


-- 'visual top down guessing':

-- GHCi> map ( zip [0 ..] ) [ ['#'] , ['.'] ]
-- [ [(0,'#')] , [(0,'.')] ]

-- GHCi> (  map $ filter ( \(_ , pe) -> pe == '#' )  ) it
-- [ [(0,'#')] , [] ]

-- GHCi> map (map fst) it
-- [ [0] , [] ]

-- GHCi> zip [0 ..] it
-- [(0,[0])]

-- GHCi> [ (h , w) | (h , ws) <- it , w <- ws ]
-- [ (0,0) ]



examples :: [Picture]
examples 
 
 = [ 
     [
       "......." ,
       "...#..." ,
       "......." ,
       "..#...." ,
       "......."
	 ]
	 ,
	 [
	   "...." ,
	   ".##." ,
	   "...."
	 ]
	 ,
	 [
	   "#" ,
	   "."
	 ]
	 ,
	 [
	   "..." ,
	   ".#." ,
	   ".#." ,
	   "..."
	 ]
   ]


-- GHCi>
-- pictureToRep $ examples !! 0
-- ( 7 , 5 , [(1,3) , (3,2)] )

-- GHCi>
-- pictureToRep $ examples !! 1
-- ( 4 , 3 , [(1,1) , (1,2)] )

-- GHCi>
-- pictureToRep $ examples !! 2
-- ( 1 , 2 , [(0,0)] )




