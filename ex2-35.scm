;;; Exercise 2.35
; use accumulate to write count-leaves
;(define (count-leaves x)
;    (cond ((null? x) 0)
;          ((not (pair? x)) 1)
;          (else (+ (count-leaves (car x)) (count-leaves (cdr x))))))
(load "sequence-operations.scm")
(define (count-leaves t)
    (accumulate + 0 (map (lambda (x) 1) (enumerate-tree t))))
(count-leaves (list 1 (list 3 4) 5))
