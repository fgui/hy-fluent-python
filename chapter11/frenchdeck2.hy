(import collections)

(setv Card (.namedtuple collections "Card" ["rank" "suit"]))

(defclass FrenchDeck2 [collections.MutableSequence]
  [ranks (+ (lfor n (range 2 11) (str n)) (list "JQKA"))
   suits (.split "spades diamonds clubs hearts")]

  (defn --init-- [self]
    (setv self.-cards (lfor suit self.suits
                           rank self.ranks
                           (Card rank suit))))

  (defn --len-- [self]
    (len self.-cards))

  (defn --getitem-- [self position]
    (get self.-cards position))

  (defn --setitem-- [self position value]
    (setv (get self.-cards position) value))

  (defn --delitem-- [self position]
    (del (get self.-cards position)))

  (defn insert [self position value]
    (.insert self.-cards position value))
  )


(comment
  (setv fdeck (FrenchDeck2))
  )
