;; Exercise 3.12
;; (append! x y) modifies the final pair of x so its cdr is now y.
(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)
(define (last-pair x)
  (if (null? (cdr x))
    x
    (last-pair (cdr x))))
; test
(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))
z
(cdr x)
; b
(define w (append! x y))
w
x
(eq? w x)
(cdr x)
