;;7-1
(comment

  (defn deco [func]
    (defn inner []
      (print "running inner()"))
    inner)

  (with-decorator deco
    (defn target []
      (print "running target()")))

  (do ;; to evaluate tag macro
    #@(deco
        (defn target2 []
          (print "running target()"))))

  (target)
  (target2)

  )
