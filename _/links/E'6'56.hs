--
--
--
-----------------
-- Exercise 6.56.
-----------------
--
--
--
module E'6'56 where



import E'6'53 ( CardType )
import E'6'54 ( Card )
import E'6'55 ( Player )




data TrickType

 =  Trick Player CardType -- Implicit definition: this (first) player in a trick leads.
          Player CardType
          Player CardType
          Player CardType
                       
    deriving ( Read , Show )

-- Disadvantage: if we forget this implicit definition (compiler won't tell us) ...


-- We might use lists too. Their advantage would be, that we might extend the game later - allow 
-- different numbers of players (more or less than four) - without the need for a new type like with ADTs.
-- List comprehension helps to avoid explicit definitions ("hardcoded definitions") + less writing.
-- There is the possibility to use both, too - more definitions, conversions, but less tradeoff?




-- Other solutions for "Trick":



type Trick2 =  [ (Player , Card) ]   -- Implicit definition: (first tuple) player in a trick defines the lead.
                                     -- Disadvantage: if we forget this implicit definition (compiler won't tell us) ...



type Trick3 = (
                  (Player , Card)   , -- Lead.
                [ (Player , Card) ]   -- Other players.
              )




