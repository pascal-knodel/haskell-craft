--
--
--
----------------
-- Exercise 6.9.
----------------
--
--
--
module E'6''9 where



import E'6''8 ( rotate90 )

import Pictures ( Picture )

import Data.List ( transpose )




-- If picture is rectangular:
rotate90anticlockwise :: Picture -> [[Char]]
rotate90anticlockwise picture

 =  reverse (transpose picture)


-- Other solution for "rotate90anticlockwise":


rotate90anticlockwise' :: Picture -> [[Char]]
rotate90anticlockwise' picture

 =  (rotate90 . rotate90 . rotate90) picture




