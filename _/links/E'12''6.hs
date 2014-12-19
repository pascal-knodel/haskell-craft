--
--
--
-----------------
-- Exercise 12.6.
-----------------
--
--
--
module E'12''6 where



-- import B'C'6
--  (
--    Position
--  , Image
--  )


import Pictures
 (
   Picture
 , printPicture
 , width
 , height
 , flipH
 , flipV
 , rotate
 )

import Data.List
 (
   transpose
 )




type Position = (Int , Int)
type Image = (Picture , Position)




-- Ex. 6.29, "makeImage":
-------------------------


makeImage :: Picture -> Position -> Image
makeImage pic pos

 =  (pic , pos)



-- Ex. 6.30, "changePosition":
------------------------------


changePosition :: Image -> Position -> Image
changePosition (pic , _) pos

 =  (pic , pos)



-- Ex. 6.31, "moveImage":
-------------------------


moveImage :: Image -> Int -> Int -> Image
moveImage ( pic , (oh , ov) ) nh nv

 =   ( pic , (oh + nh , ov + nv) )



-- Ex. 6.32, "printImage":
--------------------------


printImage :: Image -> IO ()
printImage ( pic , (h , v) )

 =  printPicture pic



-- Ex. 6.33, "flipH", "flipV", "rotate", "rotate90":
----------------------------------------------------


nFlipH :: Image -> Image
nFlipH (pic , pos)

 =  (flipH pic , pos)


nFlipV :: Image -> Image
nFlipV (pic , pos)

 =  (flipV pic , pos)


nRotate :: Image -> Image
nRotate (pic , pos)

 =  (rotate pic , pos)


nRotate90 :: Image -> Image
nRotate90 (pic , pos)

 =  ( (transpose . reverse) pic , pos)
 
-- Note: I used "map reverse . transpose" the first time in 12.6
--       - that was inefficient.



-- Ex. 6.34, "flipH", "flipV", "rotate", "rotate90":
----------------------------------------------------


gFlipH :: Image -> Image
gFlipH ( p , (h , v) )

 =  nFlipH ( p , (h - width p , v) )


gFlipV :: Image -> Image
gFlipV ( p , (h , v) )

 =  nFlipV ( p , (h , v - height p) )


-- Note: I could have done this earlier.
--       But in 6.34 I decided to try to write 'talking code'.


gRotate :: Image -> Image
gRotate ( p , (h , v) )

 =  ( rotate p , (h + width p , v - height p) )


gRotate90 :: Image -> Image
gRotate90 ( p , (h , v) )

 =  ( (transpose . reverse) p , ( h + width p , v) )



-- Ex. 6.35, "pad":
-------------------


-- Contract: positive integer arguments.

pad :: Picture -> Int -> Int -> Int -> Int -> Picture
pad p r l b t

 =     (    replicate t (replicate (l + width p + r) '.') ++ )
    .  ( ++ replicate b (replicate (l + width p + r) '.')    )
	
    .  map (replicate l '.' ++)
	.  map (++ replicate r '.')
	
	$  p

-- Note: I consider 'r', 'l', 'b', 't' as whitespace
--       to get a visual clue about correctness of the
--       defintion when printing out the result(s).


{- GHCi>

let p = ["#"]
let r = 3
map (++ replicate r 'r') p

-}
-- ["#rrr"]
--
{- GHCi>

let l = 3
map (replicate l 'l' ++) it

-}
-- ["lll#rrr"]
--
{- GHCi>

let b = 3
( ++ replicate b (replicate (l + width p + r) 'b') ) it

-}
-- ["lll#rrr","bbbbbbb","bbbbbbb","bbbbbbb"]
--
{- GHCi>

let t = 3
( replicate t (replicate (l + width p + r) 't') ++ ) it

-}
-- ["ttttttt","ttttttt","ttttttt","lll#rrr","bbbbbbb","bbbbbbb","bbbbbbb"]
--
-- GHCi> printPicture it
-- ttttttt
-- ttttttt
-- ttttttt
-- lll#rrr
-- bbbbbbb
-- bbbbbbb
-- bbbbbbb


{- GHCi>

:m +Pictures
printPicture $ pad horse 1 2 3 4

-}
-- ttttttttttttttt
-- ttttttttttttttt
-- ttttttttttttttt
-- ttttttttttttttt
-- ll.......##...r
-- ll.....##..#..r
-- ll...##.....#.r
-- ll..#.......#.r
-- ll..#...#...#.r
-- ll..#...###.#.r
-- ll.#....#..##.r
-- ll..#...#.....r
-- ll...#...#....r
-- ll....#..#....r
-- ll.....#.#....r
-- ll......##....r
-- bbbbbbbbbbbbbbb
-- bbbbbbbbbbbbbbb
-- bbbbbbbbbbbbbbb
 
 

-- Ex. 6.36, "superimposition":
-------------------------------


superimpose :: Picture -> Picture -> Picture
superimpose

 =  zipWith (zipWith ( \l r -> if (l == '.' && r == '.') then ('.') else ('#') ))


superimposeImage :: Image -> Image -> Image
superimposeImage ( p1 , (x1 , y1) ) ( p2 , (x2 , y2) )

 =  ( superimpose pp1 pp2 , (min x1 x2 , min y1 y2) )
 
 where
 
 w1 =  width p1
 w2 =  width p2
 
 h1 =  height p1
 h2 =  height p2
 
 -- p1 is fixed:
 
 l1 = abs $ min x1 x2 - x1                        -- gap / left
 r1 = abs $ max (x1 + w1) (x2 + w2) - (x1 + w1)   -- gap / right
 b1 = abs $ min y1 y2 - y1                        -- gap / bottom
 t1 = abs $ max (y1 + h1) (y2 + h2) - (y1 + h1)   -- gap / top
 
       -- r l b t
 pp1 = pad p1 r1 l1 b1 t1
 
 -- p2 is fixed:
 
 l2 = abs $ min x2 x1 - x2
 r2 = abs $ max (x2 + w2) (x1 + w1) - (x2 + w2)
 b2 = abs $ min y2 y1 - y2
 t2 = abs $ max (y2 + h2) (y1 + h1) - (y2 + h2)
       
	   -- r l b t
 pp2 = pad p2 r2 l2 b2 t2

 -- Note: You could write a function that calculates the paddings.


{- GHCi>


:load E'12''3 E'12''4 E'12''5 E'12''6
:m +E'12''3 E'12''4 E'12''5 E'12''6 Pictures


let superimpose = E'12''6.superimpose

let p1 = E'12''6.examples !! 0
let c1 = (0 , 0)
let i1 = (p1 , c1 )
printImage i1

let p2 = E'12''6.examples !! 1
let c2 = (4 , 3)
let i2 = (p2 , c2 )
printImage i2

printPicture $ superimposeImage i1 i2


--


let p1 = E'12''6.examples !! 3
let c1 = (2 , 2)
let i1 = (p1 , c1 )
printImage i1

let p2 = E'12''6.examples !! 3
let c2 = (6 , 4)
let i2 = (p2 , c2 )
printImage i2

let w1 =  width p1
let w2 =  width p2
 
let h1 =  height p1
let h2 =  height p2

let x1 = fst c1
let x2 = fst c2

let y1 = snd c1
let y2 = snd c2

let l1 = abs $ min x1 x2 - x1
let r1 = abs $ max (x1 + w1) (x2 + w2) - (x1 + w1)
let b1 = abs $ min y1 y2 - y1
let t1 = abs $ max (y1 + h1) (y2 + h2) - (y1 + h1)
 
let pp1 = pad p1 r1 l1 b1 t1

printPicture pp1

printImage $ superimposeImage i1 i2

-}
-- ###############
-- #.............#
-- #.............#
-- #...#######...#
-- #...#.....#...#
-- #...#.###.#...#
-- #...#.###.#...#
-- #...#.###.#...#
-- #...#.###.#...#
-- #...#.....#...#
-- #...#######...#
-- #.............#
-- #.............#
-- ###############
--
-- ......
-- ......
-- .#....
-- #.....
--
-- .....#
-- ....#.
-- .#....
-- #.....



examples :: [Picture]
examples

 = [
     -- 0
     [
	   "###############" ,
	   "#.............#" ,
	   "#.............#" ,
	   "#.............#" ,
	   "#.............#" ,
	   "#.....###.....#" ,
	   "#.....###.....#" ,
	   "#.....###.....#" ,
	   "#.....###.....#" ,
	   "#.............#" ,
	   "#.............#" ,
	   "#.............#" ,
	   "#.............#" ,
	   "###############"
	 ]
	 ,
	 -- 1
	 [
	   "#######" ,
	   "#.....#" ,
	   "#.....#" ,
	   "#.....#" ,
	   "#.....#" ,
	   "#.....#" ,
	   "#.....#" ,
	   "#######"
	 ]
	 ,
	 -- 2
	 [
	   "..............." ,
       "..............." ,
       "..............." ,
       "....#######...." ,
       "....#.....#...." ,
       "....#.....#...." ,
       "....#.....#...." ,
       "....#.....#...." ,
       "....#.....#...." ,
       "....#.....#...." ,
       "....#######...." ,
       "..............." ,
       "..............." ,
       "..............."
	 ]
	 ,
	 -- 3
	 [
	   ".#" ,
	   "#."
	 ]
   ]



-- Ex. 6.37, "imageAbove", "imageBeside":
-----------------------------------------


imageAbove :: Image -> Image -> Image
imageAbove (top , _) ( bottom , (bottomX , bottomY) )

 =  superimposeImage ( top    , (bottomX , bottomY + height bottom) ) 
                     ( bottom , (bottomX , bottomY                ) ) 

{- GHCi>

:load E'12''3 E'12''4 E'12''5 E'12''6
:m +E'12''3 E'12''4 E'12''5 E'12''6 Pictures

let p = E'12''6.examples !! 3
printPicture p

printImage $ imageAbove ( p , (2,2) ) ( p `beside` p , (2,2) )

-}
-- .#..
-- #...
-- .#.#
-- #.#.


imageBeside :: Image -> Image -> Image
imageBeside (left , _) ( right , (rightX , rightY) )

 =  superimposeImage ( left  , ( rightX + width right , rightY )  )
                     ( right , ( rightX               , rightY )  )

{- GHCi>

:load E'12''3 E'12''4 E'12''5 E'12''6
:m +E'12''3 E'12''4 E'12''5 E'12''6 Pictures

let p = E'12''6.examples !! 3
printPicture p

printImage $ imageBeside ( p , (2,2) ) ( p `beside` p , (2,2) )

-}
-- .#.#.#
-- #.#.#.



-- Ex. 6.38:
------------


-- Same.




