;;; Exercise 1.45
; find the nth-root of x
(load "repeated.scm")
(load "average-damp.scm")
(load "fixed-point.scm")
(define (root x n)
    (define (power x n)
        (if (= n 0) 
        1
        (* x (power x (- n 1)))))
    (define (fixed-point-transform g transform guess)
        (fixed-point ((repeated transform (- n 1)) g) guess))
    (fixed-point-transform (lambda (y) (/ x (power y (- n 1)))) average-damp 1.0))
;test part
;(root 32 5)
;(root 8 3)
;(root 27 3)
;(root 2 5)
