;;; Exercise 1.44
(load "ex1-43.scm")
(load "square.scm")

(define dx 0.00001)
(define (smooth f)
    (lambda (x) 
    (/ (+ (f x) (f (+ x dx)) (f (- x dx))) 3.0)))

(define (n-fold-smooth f n)
    ((repeated smooth n) f))

((n-fold-smooth square 10) 5)

;if I write like this in the n-fold-smooth procedure:
;(repeated (smooth f) n) then it is (smooth f)^n rather then (smooth^n f)
