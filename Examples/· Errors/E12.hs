module E12 where



list = [(0, 1), (1, 2)]

definition argument = [secondItem | (argument, secondItem) <- list ]

-- logic error: argument identifier in list comprehension is not related to argument of definition, it takes not the value specified via definition argument, it takes all possible values via the generator (these are the values 0, 1) and so the result is always [1, 2], regardless what's in definition argument.



{-

list = [(0, 1), (1, 2)]

definition argument = [secondItem | (firstItem, secondItem) <- list, argument == firstItem ]
              
-}