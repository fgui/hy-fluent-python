;; 7-4

(comment
  (defn f1 [a]
    (print a)
    (print b))

  (f1 3) ;; error b not defined

  ;; once we define b f1 works
  (setv b 6)
  (f1 3)

  (defn f2 [a]
    (print a)
    (print b)
    (setv b 9))

  (f2 3) ;; fails local b referenced before assignment.
  ;; python has decided that b is local!
  ;; python assumes that a variable assigned in the body of a function is local.

  (defn f3 [a]
    (global b)
    (print a)
    (print b)
    (setv b 9))

  (f3 3)
  b
  )
