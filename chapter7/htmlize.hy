(import html)

(defn htmlize-basic [obj]
  (->> obj
      repr
      html.escape
      (.format "<pre>{}</pre>")))


;; 7-21
(import [functools [singledispatch]]
        [collections [abc]]
        numbers
        html)

(with-decorator singledispatch
  (defn htmlize [obj]
    (->> obj
      repr
      html.escape
      (.format "<pre>{}</pre>"))
    ))

(with-decorator (htmlize.register str)
  (defn _ [text]
    (.format "<pre>{0}</pre>"
             (-> text
                 html.escape
                 (.replace "\n" "<br>\n")))))

(with-decorator (htmlize.register numbers.Integral)
  (defn _ [n]
    (.format "<pre>{0} (0x{0:x})</pre>" n)))

(with-decorator
  (htmlize.register tuple)
  (htmlize.register abc.MutableSequence)
  (defn _ [seq]
    (setv inner (.join "</li>\n<li>" (gfor item seq (htmlize item))))
    (+ "<ul>\n<li>" inner "</li>\n</ul>")))

;; 7-20
(coment
  (htmlize #{1 2 3})
  (htmlize abs)
  (htmlize "Heimlich & Co.\n- a game")
  (htmlize 42)
  (print (htmlize ["alpha" 66 #{3 2 1}]))
  )

