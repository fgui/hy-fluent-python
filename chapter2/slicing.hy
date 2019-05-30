(comment
  (setv l [10 20 30 40 50 60])
  (cut l None 2)
  (cut l 2)
  (cut l None 3)
  (cut l 3)

  ;; slice object

  (setv s "bicycle")
  (cut s None None 3)
  (cut s None None -1)
  (cut s None None -2)

  (setv invoice
        "
0.....6.................................40........52...55........
1909  Pimoroni PiBrella                     $17.50    3    $52.50
1489  6mm Tactile Switch x20                 $4.95    2     $9.90
1510  Panavise Jr. - PV-201                 $28.00    1    $28.00
1601  PiTFT Mini Kit 320x240                $34.95    1    $34.95
")

  (setv SKU (slice 0 6)
        DESCRIPTION (slice 6 40)
        UNIT_PRICE (slice 40 52)
        QUANTITY (slice 52 55)
        ITEM_TOTAL (slice 55 None))

  (setv line-items (-> invoice (.split "\n") (cut 2)))
  (for [item line-items]
    (print (get item UNIT_PRICE) (get item DESCRIPTION)))

  ;; assining  to slice
  (setv l (list (range 10)))
  l
  (setv (cut l 2 5) [20 30])
  l
  (del (cut l 5 7))
  l
  (setv (cut l 3 None 2) [11 22])
  l
  (setv (cut l 2 5) 100);;error as expected
  (setv (cut l 2 5) [100])
  l
  )
