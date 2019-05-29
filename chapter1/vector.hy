(import [math [hypot]])

(defclass Vector []

  (defn --init-- [self &optional [x 0] [y 0]
                  ]
    (setv self.x x
          self.y y))

  (defn --repr-- [self]
    (% "Vector(%r, %r)" (, self.x self.y)))

  (defn --abs-- [self]
    (hypot self.x self.y))

  (defn --bool-- [self]
    (bool (abs self)))

  (defn --add-- [self other]
    (Vector
      (+ self.x other.x)
      (+ self.y other.y)))

  (defn --mul-- [self scalar]
    (Vector
      (* self.x scalar)
      (* self.y scalar)))
  )


(comment

  (setv v1 (Vector 2 4)
        v2 (Vector 2 1))
  (+ v1 v2)


  (setv v (Vector 3 4))
  (abs v)

  (* v 3)
  (abs (* v 3))
  )
