--
--
--
----------------
-- Exercise 6.3.
----------------
--
--
--
module E'6''3 where



-- shift :: ((Integer, Integer), Integer) -> (Integer, (Integer, Integer))
shift (  ( x , y ) , z  )

 = (  x , ( y , z )  )

-- shift :: ((a, b), c) -> (a, (b, c))

-- GHCi> :t shift
-- shift :: ((t, t1), t2) -> (t, (t1, t2))




