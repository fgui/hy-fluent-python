;; 12-4

(defclass A []
  (defn ping [self] (print "ping:" self)))

(defclass B [A]
  (defn pong [self] (print "pong:" self)))

(defclass C [A]
  (defn pong [self] (print "PONG:" self)))

(defclass D [B C]

  (defn ping [self]
    (.ping (super))
    (print "post-ping:" self))

  (defn pingpong [self]
    (.ping self)
    (.ping (super))
    (.pong self)
    (.pong (super))
    (.pong C self))
  )

(comment
  ;; 12-5
  (setv d (D))
  (.pong d)
  (.pong C d)
  (.pingpong d)
  D.--mro--

  ;; 12-6
  (setv d (D))
  (.ping d)


  ;; 12-7
  (.pingpong d)


  ;;12-8 Method Resolution Order
  bool.--mro--

  (defn print-mro [cls]
    (print (.join ", " (gfor c cls.--mro-- c.--name--))))

  (print-mro bool)
  (import numbers io)
  (print-mro numbers.Integral)
  (print-mro io.BytesIO)
  (print-mro io.TextIOWrapper)

  (import tkinter)
  (print-mro tkinter.Text)
  )
