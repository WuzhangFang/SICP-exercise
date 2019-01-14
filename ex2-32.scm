;;; Exercise 2.32
; The subsets equals (1) the set of all subsets excluding the first number PLUS
;                    (2) the all subsets except first number with first number inserted.
; For eg., (list 2 3)
; (1) = () (3)
; (2) = (2) (2 3)
; total = () (3) (2) (2 3)
; map with go through the elements in the rest.
(define (subsets s)
    (if (null? s) (list `())
        (let ((rest (subsets (cdr s))))
             (append rest (map (lambda (x) (cons (car s) x)) rest)))))
(subsets (list 1 2 3))

