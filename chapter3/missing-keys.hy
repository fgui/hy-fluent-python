"Building an index mapping word -> list of occurrences"

(import sys
        re)

(setv WORD_RE (.compile re r"\w+")
      index {})
(with [fp (open (get sys.argv 1) :encoding "utf-8")]
  (for [[line-no line] (enumerate fp 1)]
    (for [match (WORD_RE.finditer line)]
      (setv word (match.group)
            colum-no (inc (match.start))
            location (, line-no colum-no)
            occurrences (.get index word []))
      (.append occurrences location)
      (setv (get index word) occurrences)
      )))
(for [word (sorted index :key str.upper)]
  (print word (get index word)))

;; hy missing-keys.hy zen.txt


