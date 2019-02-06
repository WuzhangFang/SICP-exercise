;; Exercise 3.16
(load "ex3-13.scm")
(define (count-pairs x)
    (if (not (pair? x))
        0
        (+ (count-pairs (car x))
           (count-pairs (cdr x))
           1)))
(define lst1 (list 1 2 3))
lst1
(count-pairs lst1)
(define lst4 (make-cycle lst1))
(count-pairs lst4)
