(setv l ["spam" "spam" "eggs" "spam"])
l
(set l)
(list (set l))
(-> l set list)

(& #{1 2 3} #{3 2})
(.intersection #{1 2 3} #{3 2})

(setv s #{1})
(type s)
(.pop s)
s
(hash #{1 2 3})
;;error
(hash (frozenset #{1 2 3 }))
(frozenset (range 10))

;;set comprehension

(import unicodedata)
(sfor i (range 32 256)
      :if (in "SIGN" (unicodedata.name (chr i) ""))
      (chr i))

