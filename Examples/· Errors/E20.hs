module E20 where



list = []

definition = last list == '\n' && list /= [] -- No exception is thrown.



{-


list = []

definition = list /= [] && last list == '\n' -- No exception is thrown.


-}