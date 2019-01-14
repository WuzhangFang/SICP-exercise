;;; Exercise 1.42
(load "inc.scm")
(load "square.scm")
(define (compose f g)
    (lambda (x) (f (g x))))
((compose square inc) 6)
