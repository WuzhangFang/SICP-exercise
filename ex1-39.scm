;;; Exercise 1.39
; Use the general procedure in Exersise 1.37 and define d(i) and n(i)
(load "square.scm")
(load "ex1-37.scm")
(define (tan-cf x k)
    (define (n i)
        (if (= i 1)
            x
            (- (square x))))
    (define (d i)
        (- (* 2 i) 1))
    (exact->inexact(cont-frac-rec n d k)))

(tan 10)
(tan-cf 10 100)
