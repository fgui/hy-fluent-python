;; 6-1
(import [abc [ABC abstractmethod]]
        [collections [namedtuple]])

(setv Customer (namedtuple "Customer" "name fidelity"))

(defclass LineItem []
  (defn --init-- [self product quantity price]
    (setv
      self.product product
      self.quantity quantity
      self.price price))
  (defn total [self]
    (* self.price self.quantity)))

(defclass Order []
  (defn --init-- [self customer cart &optional [promotion None]]
    (setv
      self.customer customer
      self.cart (list cart)
      self.promotion promotion))
  (defn total [self]
    (when (not (hasattr self "__total"))
      (setv self.--total (sum (gfor item self.cart (item.total)))))
    self.--total)
  (defn due [self]
    (setv discount
          (if (none? self.promotion)
              0
              (self.promotion.discount self)
              ))
    (- (self.total) discount))
  (defn --repr-- [self]
    (setv fmt "<Order total: {:.2f} due: {:.2f}>")
    (fmt.format (self.total) (self.due))))

(defclass Promotion [ABC] ;; the Strategy an abstract class
  (with-decorator abstractmethod
    (defn discount [self order]
      "Return discount as a positive dollar amount")))

(defclass FidelityPromo [Promotion]
  (defn discount[self order]
    (if (> order.customer.fidelity 1000)
        (* .05 (order.total))
        0)))

(defclass BulkItemPromo [Promotion]
  (defn discount[self order]
    (setv discount 0)
    (for [item order.cart]
      (when (>= item.quantity 20)
        (+= discount (* .1 (item.total)))
        )
      )
    discount))

(defclass LargeOrderPromo [Promotion]
  (defn discount[self order]
    (setv distinct-items (sfor item order.cart item.product))
    (if (>= (len distinct-items) 10)
        (* .07 (order.total))
        0)))

(comment
  (setv
    joe (Customer "John Doe" 0)
    ann (Customer "Ann Smith" 1100)
    cart [(LineItem "banana" 4 .5)
          (LineItem "apple" 10 1.5)
          (LineItem "watermellon" 5 5.0)])

  (Order joe cart (FidelityPromo))
  (Order ann cart (FidelityPromo))

  (setv banana-cart [(LineItem "banana" 30 .5)
                     (LineItem "apple" 10 1.5)])

  (Order joe banana-cart (BulkItemPromo))

  (setv long-order (lfor item-code (range 10)
                         (LineItem (str item-code) 1 1.0)))
  (Order joe long-order (LargeOrderPromo))
  (Order joe cart (LargeOrderPromo))
  )


