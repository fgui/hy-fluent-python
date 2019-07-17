;;5-15
(defn clip [text &optional [max-len 80]]
  "Return text clipped at the last space before or after max-len"
  (setv end None)
  (when (> (len text) max-len)
      (do (setv space-before (text.rfind " " 0 max-len))
          (if (>= before-space 0)
              (setv end space-before)
              (when (>= space-after 0)
                (setv end space-after)
                ))))
  (when (none? end)
    (setv end (len text)))
  (.rstrip (cut text None end))
  )

(comment

  ;; 5-16
  clip.--defaults--

  clip.--code--

  clip.--code--.co_varnames

  clip.__code__.co_argcount

  ;; 5-17
  (import [inspect [signature]])
  (setv sig (signature clip))
  sig
  (str sig)

  (for [[name param] (sig.parameters.items)]
    (print param.kind ":" name "=" param.default))
  )
