;;; Exercise 2.41
; Write a procedure to find all ordered triples of distinct positive integers
; i, j, and k less than or equal to a given integer n that sum to a given integer s.
(load "sequence-operations.scm")
(load "ex2-40.scm")

(define (triple-sum n sum)
    (define (sum-equal? triple-pair)
        (= sum 
           (+ (list-ref triple-pair 0) 
              (list-ref triple-pair 1)
              (list-ref triple-pair 2))))
    (filter sum-equal? 
                      (triple-pairs n)))

(define (triple-pairs n)
    (flatmap (lambda (i) (map (lambda (j) (cons i j)) (unique-pairs (- i 1))))
                (enumerate-interval 1 n)))
; test
(triple-sum 11 11)
