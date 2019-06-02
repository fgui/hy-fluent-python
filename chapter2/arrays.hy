(comment

  ;; work with a 10 million array of float-point random numbers
  (import [array [array]]
          [random [random]])
  (setv floats (array "d"
                      (gfor i (range (** 10 7)) (random))))
  (get floats -1)
  (setv fp (open "floats.bin" "wb"))
  (.tofile floats fp)
  (.close fp)
  (setv floats2 (array "d")
        fp (open "floats.bin" "rb"))
  (.fromfile floats2 fp (** 10 7))
  (.close fp)
  (get floats2 -1)
  (= floats2 floats)

  ;; clean up
  (import os)
  (os.remove "floats.bin" )

  (setv numbers (array "h" [-2 -1 0 1 2])
        memv (memoryview numbers))
  (len memv)
  (get memv 0)
  (setv memv-oct (memv.cast "B"))
  (memv-oct.tolist)
  (setv (get memv-oct 5) 4)
  numbers
  
  )
