;;; 1.2.4 Exponentiation
; recursive
;(define (expt1 b n)
;    (if (= n 0) 1 (* b (expt1 b (- n 1)))))
;(expt1 2 3)
;; iterative 
;(define (expt2 b n)
;    (iter b n 1))
;(define (iter b counter product)
;    (if (= counter 0) product (iter b (- counter 1) (* b product))))
;(expt2 2 3)
; improve
(define (fast-expt b n)
    (cond ((= n 0) 1)
          ((even? n) (square (fast-expt b (/ n 2))))
          (else (* b (fast-expt b (- n 1))))))
(define (even? n) (= (remainder n 2) 0))
(define (square x) (* x x))
;(fast-expt 2 3)
