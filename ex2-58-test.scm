(define (memr item x)
  (if (pair? x)
    (reverse (memq item (reverse x)))
    x))

(define s '(1 + 2 + 3))

(memr '+ s)
(car s)

(memq '+ s)
(cdr (memq '+ s))

