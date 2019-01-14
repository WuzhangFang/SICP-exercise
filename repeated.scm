;;; Exercise 1.43
(load "ex1-42.scm")
(define (repeated f n)
    (if (= 1 n)
        f 
        (compose f (repeated f (- n 1)))))
