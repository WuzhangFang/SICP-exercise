;;; Exercise 2.40
(load "sequence-operations.scm")
(define (unique-pairs n)
    (flatmap (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) 
                (enumerate-interval 1 n)))
(unique-pairs 3)
