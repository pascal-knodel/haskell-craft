--
--
--
-----------------
-- Exercise 12.3.
-----------------
--
--
--
module E'12''3 where



import Pictures
 (
   Picture
 )




makePicture :: Int -> Int -> [(Int, Int)] -> Picture
makePicture w h ps

 =  makePicture' w h ps   -- TEMFIN NONFIN: higher order function definition.




-- Other solutions for "makePicture":



makePicture' :: Int -> Int -> [(Int, Int)] -> Picture
makePicture' gw gh gps   -- "gw"; given width, "gh"; given height, "gps"; given points

 =  [ [ if ( (h , w) `elem` gps ) then ('#') else ('.') | w <- [0 .. gw - 1] ] | h <- [0 .. gh - 1] ]

 
-- GHCi> Pictures.printPicture $ makePicture' 7 5 [(1 , 3) , (3 , 2)]
-- .......
-- ...#...
-- .......
-- ..#....
-- .......


-- Notes: * Not very efficient, because we don't drop "gps"
--          after we have 'drawn' a 'black pixel' "#". In this case we won't
--          draw it again and therefore could remove it from the list,
--          because there is no need to compare it in a future search
--          through the list. A contract that would expect a sorted list
--          would help too.
--        * Readability depends on the reader - no seriously - it could be
--          rewritten: not just one list comprehension.




