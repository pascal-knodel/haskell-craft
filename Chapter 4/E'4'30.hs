--
--
--
-----------------
-- Exercise 4.30.
-----------------
--
--
--
module E'4'30 where



import PicturesSVG
 
 (
   Picture
 , black
 , beside
 , white
 , above
 )




blackWhiteRowL :: Integer -> Picture -- (grows) Left; L
blackWhiteRowL repetitions

 |  repetitions <= 1 =  black
 |  otherwise        =  whiteBlackRowL (repetitions - 1)  `beside`  black



whiteBlackRowL :: Integer -> Picture -- (grows) Left; L
whiteBlackRowL repetitions

 |  repetitions <= 1 =  white
 |  otherwise        =  blackWhiteRowL (repetitions - 1)  `beside`  white



blackWhiteColumnU :: Integer -> Picture -- (grows) Up; U
blackWhiteColumnU repetitions

 | repetitions <= 1 =  black
 | otherwise        =  whiteBlackColumnU (repetitions - 1)  `above`  black



whiteBlackColumnU :: Integer -> Picture -- (grows) Up; U
whiteBlackColumnU repetitions

 | repetitions <= 1 =  white
 | otherwise        =  blackWhiteColumnU (repetitions - 1)  `above`  white



chessBoard :: Integer -> Picture
chessBoard n

 | n == 1    =  white 
 | otherwise =            (  ( chessBoard (n - 1) )         `above`  ( blackWhiteRowL (n - 1) )  )
                `beside`  (  ( blackWhiteColumnU (n - 1) )  `above`  white                       )


-- GHCi> render ( chessBoard 8 )




-- Future solution: see ex. 12.1




