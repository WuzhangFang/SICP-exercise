;;; Exercise 1.40
(load "newton.scm")
(define (cubic a b c) (lambda (x) (+ (* x x x) (* a x x) (* b x) c)))
(newton-method (cubic 3 2 1) 1)
