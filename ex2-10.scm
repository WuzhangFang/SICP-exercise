;;; Exercise 2.10
(load "ex2-8.scm")
(define (div-interval x y)
    (if (span-zero? y) 
         (error "interval spans zero.")
    (mul-interval x
                  (make-interval
                        (/ 1.0 (upper-bound y))
                        (/ 1.0 (lower-bound y))))))
(define (span-zero? x)
    (and (>= (upper-bound x) 0) (<= (lower-bound x) 0)))
