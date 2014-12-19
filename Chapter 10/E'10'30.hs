--
--
--
------------------
-- Exercise 10.30.
------------------
--
-- 
--
module E'10'30 where



import Pictures ( Picture , width , height )




-- From ex. 6.4 ...


superimposeChar :: Char -> Char -> Char
superimposeChar '.' '.' =  '.'
superimposeChar _   _   =  '#'


-- From ex. 6.5 ...


superimposeString :: String -> String -> String
superimposeString []         []         =  []
superimposeString ( a : as ) []         =  ( superimposeChar a   '.' ) : superimposeString as []
superimposeString []         ( b : bs ) =  ( superimposeChar '.' b   ) : superimposeString [] bs
superimposeString ( a : as ) ( b : bs ) =  ( superimposeChar a   b   ) : superimposeString as bs


-- ...



superimpose :: Picture -> Picture -> Picture
superimpose a b

 =  zipWith superimposeString a b


a :: Picture
a =  [
       "#.." ,
       ".#." ,
       "..#"
     ]


b :: Picture
b =  [
       "..#" ,
       ".#." ,
       "#.."
     ]


{- GHCi>

superimpose a b

-}
-- [ 
--   "#.#" ,
--   ".#." ,
--   "#.#"
-- ]


{- GHCi>

superimpose ( a ++ [ "..." ] ) b

-}
-- [ 
--   "#.#" ,
--   ".#." ,
--   "#.#"
-- ]


{- GHCi>

superimpose a ( b  ++ [ "..." ] )

-}
-- [ 
--   "#.#" ,
--   ".#." ,
--   "#.#"
-- ]




superimpose' :: Picture -> Picture -> Picture
superimpose' a b

 =  superimpose a b  ++  replicate heightDiff ( replicate maxWidth '.' )
 
 where
 
 maxWidth , heightDiff  :: Int
 maxWidth   =  max (width  a) (width  b)
 heightDiff =  abs ( (height a) - (height b) )


{- GHCi>

superimpose' ( a ++ [ "..." ] ) b

-}
-- [ 
--   "#.#" ,
--   ".#." ,
--   "#.#" ,
--   "..."
-- ]


{- GHCi>

superimpose' a ( b  ++ [ "..." ] )

-}
-- [ 
--   "#.#" ,
--   ".#." ,
--   "#.#" ,
--   "..."
-- ]




