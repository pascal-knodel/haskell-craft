--
--
--
-----------------
-- Exercise 6.35.
-----------------
--
--
--
module E'6'35 where



import Pictures
 (
   Picture
 , beside
 , above
 , width
 , height
 )




-- Note:
--
-- There is a problem with above and beside in Picture.hs from Craft3e-0.1.0.10:
-- The beside and above functions behave different:
--
-- beside [] aPicture = beside aPicture [] = []
-- above [] aPicture = above aPicture [] = aPicture
--
-- It can be disturbing while defining the functions ...


padBeside :: Picture -> Int -> Picture
padBeside picture 0 = picture
padBeside picture numberOfPads

 |  numberOfPads < 0  = paddingLeft `beside` picture
 |  numberOfPads > 0  = picture     `beside` paddingRight
 
 where
 
 paddingLeft, paddingRight :: [[Char]]
 paddingLeft  =  replicate (height picture) ( replicate (-numberOfPads) '.' )
 paddingRight =  replicate (height picture) ( replicate ( numberOfPads) '.' )
 
 
padAbove :: Picture -> Int -> Picture
padAbove picture 0 =  picture
padAbove picture numberOfPads

 |  numberOfPads < 0  = picture    `above` paddingBottom
 |  numberOfPads > 0  = paddingTop `above` picture

 
 where
 
 paddingTop, paddingBottom :: [[Char]]
 paddingTop    =  replicate ( numberOfPads) ( replicate (width picture) '.' )
 paddingBottom =  replicate (-numberOfPads) ( replicate (width picture) '.' )




-- Other solution:


padLeft :: Picture -> Int -> Picture
padLeft picture numberOfPads

 =  paddingLeft `beside` picture
 
 where
 
 paddingLeft :: [[Char]]
 paddingLeft =  [ leftRowExtension | _ <- [1 .. (height picture)] ]
 
 leftRowExtension :: [Char]
 leftRowExtension =  [ '.' | _ <- [1 .. numberOfPads] ]


padRight :: Picture -> Int -> Picture
padRight picture numberOfPads

 =  picture `beside` paddingRight
 
 where
 
 paddingRight :: [[Char]]
 paddingRight =  [ rightRowExtension | _ <- [1 .. (height picture)] ]
 
 rightRowExtension :: [Char]
 rightRowExtension =  [ '.' | _ <- [1 .. numberOfPads] ]

 
padTop :: Picture -> Int -> Picture
padTop picture numberOfPads

 =  paddingTop `above` picture
 
 where
 
 paddingTop :: [[Char]]
 paddingTop =  [ topRowExtension | _ <- [1 .. numberOfPads] ]
 
 topRowExtension :: [Char]
 topRowExtension =  [ '.' | _ <- [1 .. (width picture)] ]
 
 
padBottom :: Picture -> Int -> Picture
padBottom picture numberOfPads

 =  picture `above` paddingBttom
 
 where
 
 paddingBttom :: [[Char]]
 paddingBttom =  [ bottomRowExtension | _ <- [1 .. numberOfPads] ]
 
 bottomRowExtension :: [Char]
 bottomRowExtension =  [ '.' | _ <- [1 .. (width picture)] ]
 

 
padLeft' :: Picture -> Int -> Picture
padLeft' picture numberOfPads

 =  paddingLeft `beside` picture
 
 where
 
 paddingLeft :: [[Char]]
 paddingLeft =  replicate (height picture) (replicate numberOfPads '.')
 

padRight2 :: Picture -> Int -> Picture
padRight2 picture numberOfPads

 =  picture `beside` paddingRight
 
 where
 
 paddingRight :: [[Char]]
 paddingRight =  replicate (height picture) (replicate numberOfPads '.')
 
 
padTop' :: Picture -> Int -> Picture
padTop' picture numberOfPads

 =  paddingTop `above` picture
 
 where
 
 paddingTop :: [[Char]]
 paddingTop =  replicate numberOfPads ( replicate (width picture) '.' )
 
 
padBottom2 :: Picture -> Int -> Picture
padBottom2 picture numberOfPads

 =  picture `above` paddingBottom
 
 where
 
 paddingBottom :: [[Char]]
 paddingBottom =  replicate numberOfPads ( replicate (width picture) '.' )
 



