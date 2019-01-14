;;; Exercise 1.23
; Modify smallest-divisor. 
; We can load the original one and just change the function that we want to modify.

(load "square.scm")
(load "smallest-divisor.scm")

(define (find-divisor n test-divisor)
        (cond ((> (square test-divisor) n) n)
              ((divides? test-divisor n) test-divisor)
              (else (find-divisor n (next test-divisor)))))

(define (next test-divisor) 
    (if (= 2 test-divisor) 3 (+ 2 test-divisor)))
