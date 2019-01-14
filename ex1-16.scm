;;; Exercise 1.16
(load "square.scm")
(define (even? n) (= (remainder n 2) 0))

(define (expt b n)
        (iter 1 b n))

(define (iter a b n)
    (cond ((= n 0) a)
          ((even? n)
            (iter a (square b) (/ n 2)))                   
          (else (iter (* b a) b (- n 1)))))
; ab^n -> (ab)b^(n-1) -> (ab^n)b^0
; ab^n is invariant
(expt 2 3)
(expt 2 4)
