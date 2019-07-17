;; 5-10
(defn tag [name
           &rest content
           &kwonly [cls None]
           &kwargs attrs]
  "Generate one or more HTML tags"
  (when (not (none? cls))
    (setv (get attrs "class") cls))
  (if attrs
      (setv attr-str (.join ""
                            (gfor [attr value] (sorted (attrs.items))
                                  (% " %s=%s" (, attr value)))))
      (setv attr-str ""))
  (if content
      (.join "\n"
             (gfor c content
                   (% "<%s%s>%s</%s>" (, name attr-str c name)))
             )
      (% "<%s%s />" (, name attr-str)))
  )

(comment
  ;; 5-11
  (tag "br")
  (tag "p" "hello")
  (tag "p" "hello" :id 33)
  (print (tag "p" "hello" "world" :cls "sidebar"))
  (tag :content "testing" :name "img")
  (setv mytag {"name" "img"
               "title" "Sunset Boulevard"
               "src" "sunset.jpg"
               "cls" "framed"})
  (tag #** mytag)


  (defn f [a &kwonly b] (, a b))
  (f 1 :b 2)

  ;; 5-18
  (import inspect)
  (setv sig (inspect.signature tag))
  (setv my-tag {"name" "img"
               "title" "Sunset Boulevard"
               "src" "sunset.jpg"
               "cls" "framed"})
  (setv bound-args (.bind sig #** my-tag))
  bound-args
  (for [[name value] (bound-args.arguments.items)]
    (print name "=" value))
  (del (get my-tag "name"))
  (setv bound-args (.bind sig #** my-tag)) ;; error arg name required.


  ;;5-28
  (import [functools [partial]])
  (setv picture (partial tag "img" :cls "pic-frame"))
  (picture :src "wumpus.jgeg")
  (,
    picture.func
    picture.args
    picture.keywords)
  )
