(comment
  ;;4-1
  (setv s "café")
  (len s)
  (setv b (.encode s "utf8"))
  b
  (len b)
  (.decode b "utf8")
  ;;4-2
  (setv cafe (bytes "café" :encoding "utf8"))
  (get cafe 0)
  (cut cafe None 1) ;; slices are also bytes
  (setv cafe-arr (bytearray cafe))
  cafe-arr
  (cut cafe-arr -1)

  (.fromhex bytes "31 4B CE A9")

  ;;4-3
  (import array)
  (setv numbers (array.array "h" [-2 -1 0 1 2]) ;;h array of short integers (16 bits)
        octets (bytes numbers))
  octets

  ;;4-4
  (import struct)
  (setv fmt "<4s4sHH")
  (with [fp (open "hy.png" "rb")]
    (setv img (memoryview (.read fp)))
    )
  (setv header (cut img None 12))
  (bytes header)
  (struct.unpack fmt header)

  ;; 4-5
  (for [codec ["latin_1" "utf_8" "utf_16"]]
    (print codec (.encode "El Niño" codec) :sep "\t"))

  ;;4-6
  (setv city "São Paulo")
  (.encode city "utf_8")
  (.encode city "utf_16")
  (.encode city "iso8859_1")
  (.encode city "cp437")
  (.encode city "cp437" :errors "ignore")
  (.encode city "cp437" :errors "replace")
  (.encode city "cp437" :errors "xmlcharrefreplace")
  ;; 4-7
  (setv octets  b"Montr\xe9al")
  (.decode octets "cp1252")
  (.decode octets "iso8859_7")
  (.decode octets "koi8_r")
  (.decode octets "utf_8")
  (.decode octets "utf_8" :errors "replace")

  ;;BOM Byte Order Mark
  (setv u16 (.encode "El Niño" "utf_16")
        u16le (.encode "El Niño" "utf_16le")
        u16be (.encode "El Niño" "utf_16be") )
  (list (map list [u16 u16le u16be]))


  ;;4-9
  (.write (open "cafe.txt" "w" :encoding "utf_8") "café")
  (.read (open "cafe.txt")) ;;this may not work in windows but it works in my linux
  )
