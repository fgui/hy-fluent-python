;; 5-12

;; pip install bobo
;; hy2py bobo.hy > bobo.py
;; bobo -f bobo.py

  (import bobo)
  (with-decorator (.query bobo "/")
      (defn hello [person]
        (% "Hello %s!" person)))
