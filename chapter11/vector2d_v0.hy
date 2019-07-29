;; 11-1 / 9-2
(defclass Vector2d []
  [typecode "d"]
  (defn --init-- [self x y]
    (setv self.x (float x)
          self.y (float y)))
  (defn --iter-- [self]
    (gfor i (, self.x self.y) i))
  )
