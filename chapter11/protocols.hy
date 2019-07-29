(comment
  ;; 11-3
  (defclass Foo []
    (defn --getitem-- [self pos]
      (get (range 0 30 10) pos) ))

  (setv f (Foo))
  (get f 1)
  (for [i f] (print i))
  (in 20 f)
  (in 15 f)

  ;; 11-8
  (defn t [field-names]
    (try
      (setv field-names (.split (.replace field-names "," "")))
      (except [AttributeError]))
    (setv field-names (tuple field-names))
    field-names)

  (t "f1 f2")
  (t ["f1" "f2"])
  )
