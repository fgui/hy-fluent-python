(import collections)

(setv Card (.namedtuple collections "Card" ["rank" "suit"]))

(defclass FrenchDeck []
  [ranks (+ (lfor n (range 2 11) (str n)) (list "JQKA"))
   suits (.split "spades diamonds clubs hearts")]

  (defn --init-- [self]
    (setv self.cards (lfor suit self.suits
                           rank self.ranks
                           (Card rank suit))))

  (defn --len-- [self]
    (len self.cards))

  (defn --getitem-- [self position]
    (get self.cards position)))


(comment
  (setv beer-card (Card "7" "diamonds"))
  beer-card

  (setv deck (FrenchDeck))
  (len deck)

  (get deck 0)
  (get deck -1)

  (import [random [choice]])
  (choice deck)

  (cut deck None 3)
  (cut deck 12 None 13)

  (for [card deck] (print card))

  (for [card (reversed deck)] (print card))

  (in (Card "Q" "hearts") deck)
  (in (Card "Q" "beasts") deck)

  )

(setv suit-values {"spades" 3
                   "hearts" 2
                   "diamonds" 1
                   "clubs" 0})

(defn spades-high [card]
  (setv rank-value (.index FrenchDeck.ranks card.rank))
  (+ (* rank-value (len suit-values)) (get suit-values card.suit)))

(comment
  (for [card (sorted deck :key spades-high)]
    (print card))
  )
