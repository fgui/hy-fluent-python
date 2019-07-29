(comment

  ;;12-1
  (defclass DoppelDict [dict]
          (defn --setitem-- [self key value]
            (.--setitem-- (super) key (* [value] 2))
            ))

  (setv dd (DoppelDict :one 1))
  dd
  (setv (get dd "two") 2)
  dd
  (.update dd :three 3)
  dd

  ;;12-2
  (defclass AnswerDict [dict]
    (defn --getitem-- [self key] 42))

  (setv ad (AnswerDict :a "foo"))
  ad
  (get ad "a")
  (setv d {})
  (.update d ad)
  (get d "a")
  d

  ;;12-3
  (import collections)
  (defclass DoppelDict2 [collections.UserDict]
          (defn --setitem-- [self key value]
            (.--setitem-- (super) key (* [value] 2))
            ))

  (setv dd (DoppelDict2 :one 1))
  dd
  (setv (get dd "two") 2)
  dd
  (.update dd :three 3)
  dd

  ;;12-2
  (defclass AnswerDict2 [collections.UserDict]
    (defn --getitem-- [self key] 42))

  (setv ad (AnswerDict2 :a "foo"))
  ad
  (get ad "a")
  (setv d {})
  (.update d ad)
  (get d "a")
  d

  )
