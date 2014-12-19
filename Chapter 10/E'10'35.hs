--
--
--
------------------
-- Exercise 10.35.
------------------
--
-- 
--
module E'10'35 where




-- It depends. There are many things that might be important:
--
--   - readability ( length and precision )
--   - future changes/extensions
--   - standard problems
--   - (efficient) algorithms
--   - (future) optimisations
--   - ...
--
-- The solutions to the exercises from chapter 5 in comparison to
-- ex. 10.32 and 10.33 show the first two things just mentioned.
-- But in general its hard to predict what would be the better
-- choice. In computer science people always argue about that ...
--
-- In the case that I know that the code or problem might change in the future,
-- I would avoid using standard functions and write adaptive definitions using
-- list comprehensions and recursion directly and where it is changeable.
--
-- If it is a standard or small (sub-)problem, library functions come in handy.




