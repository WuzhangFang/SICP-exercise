;;; Exercise 1.31
; recursive
(define (product-r term a next b)
    (if (> a b)
        1
        (* (term a) (product-r term (next a) next b))))

; iterative
(define (product-i term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* result (term a)))))
    (iter a 1))

; calculate pi
(load "even.scm")
(define (next x) (+ x 1))
(define (term n) 
        (if (even? n)
            (/ (+ n 2.0) (+ n 1.0))
            (/ (+ n 1.0) (+ n 2.0))))
(define (pi n)
    (* 4 (product-r term 1 next n)))
(pi 6)
(pi 100)
(pi 1000)
