;;; Exercise 1.41
(load "inc.scm")
(define (double f)
    (lambda (x) (f (f x))))
(((double (double double)) inc) 5)
