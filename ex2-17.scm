;;; Exercise 2.17
(load "list-operations.scm")
(define (last-pair lst)
    (list-ref lst (- (length lst) 1)))
(last-pair (list 23 72 149 34))
