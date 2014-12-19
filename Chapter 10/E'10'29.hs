--
--
--
------------------
-- Exercise 10.29.
------------------
--
-- 
--
module E'10'29 where



-- import Pictures ( Picture )



type Picture = [[Char]]   -- From Pictures.hs.


invertColour :: Picture -> Picture
invertColour picture

 =  ( map . map ) invert picture
 
 where
 
 invert :: Char -> Char
 invert '.' =  '#'
 invert _   =  '.'


{- GHCi>

invertColour [ "#" , "." , " " ]

-}
-- [ "." , "#" , "." ]



type Picture'B = [[Bool]]


invertColour'B :: Picture'B -> Picture'B
invertColour'B picture

 =  ( map . map ) not picture


{- GHCi>

invertColour'B [  [ True ]  ,  [ False ]  ]

-}
-- [  [ False ]  ,  [ True ]  ]




type Picture'S = String


invertColour'S :: Picture'S -> Picture'S
invertColour'S picture

 =  map invert picture
 
 where
 
 invert :: Char -> Char
 invert '.' =  '#'
 invert _   =  '.'



{- GHCi>

invertColour'S ".# "

-}
-- "#.."




type Picture'R = [[(Int, Char)]]


invertColour'R :: Picture'R -> Picture'R
invertColour'R picture

 =  ( map . map ) invert picture
 
 where
 
 invert ( runLength , '.' ) = ( runLength , '#' )
 invert ( runLength , _   ) = ( runLength , '.' )
 


{- GHCi>

invertColour'R [  [( 1 , '.' )]  ,  [( 1 , '#' )]  ,  [( 1 , ' ' )]  ]

-}
-- [  [( 1 , '#' )] , [(1 , '.')] , [(1,'.')]  ]




