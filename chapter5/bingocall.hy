;;5-8
(import random)
(defclass BingoCage []
  (defn --init-- [self items]
    (setv self.-items (list items))
    (random.shuffle self.-items))
  (defn pick [self]
    (try
      (.pop self.-items)
      (except [IndexError e]
        (raise (LookupError "pick from empty BingoCage")))))
  (defn --call-- [self]
    (.pick self)))


(comment
  (setv bingo (BingoCage (range 3)))
  (.pick bingo)
  (bingo)
  (callable bingo)
  )
