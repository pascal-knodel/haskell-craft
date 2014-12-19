--
--
--
------------------
-- Exercise 11.33.
------------------
--
--
--
module E'11'33 where



--           (Generalization)
--
--    :<=>   foldr f st (xs ++ ys)  =  f (foldr f st xs) (foldr f st ys)
--                                                                                      | f := (++)
--     |=>   foldr (++) st (xs ++ ys)  =  (++) (foldr (++) st xs) (foldr (++) st ys)  
--                                                                                      | st := []
--     <=>   foldr (++) [] (xy ++ ys)  =  (++) (foldr (++) [] xs) (foldr (++) [] ys)
--                                                                                      | concat = foldr (++) []
--     <=>   concat (xs ++ ys)  =  (++) (concat xs) (concat ys)
--                                                                                      | (++)
--     <=>   concat (xs ++ ys)  =  concat xs ++ concat ys
--
--     <=>:  (Specialization)
--
--
--    ■  (1. Specialization Proof)




