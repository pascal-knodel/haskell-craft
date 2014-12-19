--
--
--
-----------------
-- Exercise 12.2.
-----------------
--
--
--
module E'12''2 where



type Picture'B = [[Bool]]


invertColour'B :: Picture'B -> Picture'B
invertColour'B

 =  map $ map not


superimpose'B :: Picture'B -> Picture'B -> Picture'B
superimpose'B

 =  zipWith $ zipWith (&&)

-- GHCi> superimpose'B [ [True] ] [ [False] ]
-- [ [False] ]

-- GHCi> superimpose'B [ [True] ] [ [True] ]
-- [ [True] ]


printPicture'B :: Picture'B -> IO ()
printPicture'B

 =  putStr . concat . ( \(p : ps) -> p : map ('\n' :) ps ) . map (  map ( \p -> if (p) then ('.') else ('#') )  ) . (++ [[]])

-- GHCi> printPicture'B [ [True] , [False] ]
-- .
-- #




