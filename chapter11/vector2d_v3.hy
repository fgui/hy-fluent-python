;; 11-2 / 9-9
(defclass Vector2d []
  [typecode "d"]
  (defn --init-- [self x y]
    (setv self.--x (float x)
          self.--y (float y)))


  #@(property
      (defn x [self]
        self.--x))

  #@(property
      (defn y [self]
        self.--y))
  
  (defn --iter-- [self]
    (gfor i (, self.x self.y) i))
  )
