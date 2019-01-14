;; Exercise 3.2
(define (make-accumulator sum)
    (lambda (num)
        (begin (set! sum (+ sum num))
               sum)))
    
;; test
(define A (make-accumulator 5))
(A 10)
(A 5)
