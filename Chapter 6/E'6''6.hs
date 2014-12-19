--
--
--
----------------
-- Exercise 6.6.
----------------
--
--
--
module E'6''6 where



import E'6''4 ( superimposeChar )
import E'6''5 ( superimposeLine )

import Pictures ( Picture )




superimpose :: Picture -> Picture -> Picture
superimpose a b

 =  [ superimposeLine stringA stringB | ( stringA , stringB ) <- zippedPictures ]
 
 where
 
 zippedPictures =  zip a b



-- Other solution for "superimpose":


-- (Ex. 10.30)


superimpose' :: Picture -> Picture -> Picture
superimpose'

 =  zipWith (zipWith superimposeChar)


 
 
-- Property testing:


prop_superimpose :: Picture -> Picture -> Bool
prop_superimpose a b

 =  (superimpose a b) == (superimpose' a b)

-- GHCi> quickCheck prop_superimpose




