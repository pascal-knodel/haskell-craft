--
--
--
-----------------
-- Exercise 8.22.
-----------------
--
--
--
module E'8'22 where



import B'C'8 ( Tournament )

-- Note: Chapter 4> cabal install

import B'C'4 ( Move )   




type Strategy2 =  Tournament -> Move



-- What are the advantages of doing this?
--
-- Not just a strict pattern (like with "Strategy") which depends only on moves.
-- Dynamic opponent analysis. It's more realistic.


-- Are there any disadvantages?
--
-- Because there is much difference to the existing Haskell
-- implementation, the old definitions need to be changed.


-- Can you define any strategies using "Strategy2" that you couldn't do using "Strategy"?
--
-- Yes, dynamic strategies with analysing the behaviour of the opponent become possible.




