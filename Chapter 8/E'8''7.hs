--
--
--
----------------
-- Exercise 8.7.
----------------
--
--
--
module E'8''7 where



import B'C'8 ( Strategy )

import GHC.Real ( even )




alternate :: Strategy -> Strategy -> Strategy
alternate firstStrategy alternativeStrategy moves

   -- Change strategy every move:

 |  even (length moves)  = firstStrategy moves
 |  otherwise            = alternativeStrategy moves




