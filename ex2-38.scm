;;; Exercise 2.38
; similar to accumulate procedure
(load "sequence-operations.scm")
;(define (fold-left op initial sequence)
;    (define (iter result rest)
;        (if (null? rest)
;            rest
;            (iter (op result (car rest)) (cdr rest))))
;    (iter initial sequence))
; test
(fold-right / 1 (list 1 2 3))
(fold-left / 1 (list 1 2 3))
(fold-right list `() (list 1 2 3))
(fold-left list `() (list 1 2 3))
; if the (op a b) = (op b a), then fold-right = fold-left
