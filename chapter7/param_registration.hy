;; 7-23
(setv registry (set))

(defn register [&optional [active True]]
  (defn decorate [func]
    (print (% "running registe(active=%s)->decorate(%s)"
              (, active func)))
    (if active
        (.add registry func)
        (.discard registry func))
    func)
  decorate)

#@((register :active False)
    (defn f1 [] (print("runnig (f1)"))))

#@((register)
    (defn f2 [] (print("runnig (f2)"))))

#@((register)
    (defn f3 [] (print("runnig (f3)"))))


(comment
  ;;7-24
  registry
  ((register) f3)
  registry
  ((register :active False) f2)

  )
