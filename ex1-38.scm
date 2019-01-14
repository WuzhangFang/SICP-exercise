;;; Exercise 1.38
; The important thing to find the pattern of D(i)
(load "ex1-37.scm")
(define (n i) 1.0)
(define (d i)
    (if (= 0 (remainder (+ i 1) 3))
        (* 2 (/ (+ i 1) 3))
        1))

(define (e k)
    (+ 2.0 (cont-frac-rec n d k)))
(e 10)
