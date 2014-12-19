--
--
--
----------------
-- Exercise 6.4.
----------------
--
--
--
module E'6''4 where



superimposeChar :: Char -> Char -> Char
superimposeChar '.' '.' =  '.'
superimposeChar _   _   =  '#'


-- Other solution for "superimposeChar":


superimposeChar' :: Char -> Char -> Char
superimposeChar' '.' char
           
 |  (char == '.')  = '.'
 |  otherwise      = '#'




