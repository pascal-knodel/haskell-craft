--
--
--
-----------------
-- Exercise 6.53.
-----------------
--
--
--
module E'6'53 where



data Suit

 =     Spades   
    |  Hearts   
    |  Diamonds 
    |  Clubs    
    deriving ( Eq , Read , Show )


data CardValue

 =     Two
    |  Three
    |  Four
    |  Five
    |  Six
    |  Seven
    |  Eight
    |  Nine
    |  Ten
    |  Jack
    |  Queen
    |  King
    |  Ace
    deriving ( Eq , Read , Show , Ord )
 
data CardType =  Card CardValue Suit
                 deriving ( Eq , Read , Show )
              
type Deck =  [ CardType ]




