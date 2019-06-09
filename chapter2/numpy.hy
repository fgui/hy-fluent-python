(comment
  (import numpy)
  (setv a (.arange numpy 12))
  a
  (type a)
  a.shape
  (setv a.shape (, 3 4))
  a
  (get a 2)

  (-> a (get 2) (get 1))
  (get a 2 1)

  (-> a (cut None) (get 1))

  (.transpose a)


  (import numpy)
  ;; I have to find this file:
  (numpy.loadtxt "floats-1M-lines.txt")
  )
