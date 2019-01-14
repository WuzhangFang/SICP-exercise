;;; Exercise 1.25
(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
          (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fast-expt b n)
    (cond ((= n 0) 1)
          ((even? n) (square (fast-expt b (/ n 2))))
          (else (* b (fast-expt b (- n 1))))))
(define (even? n) (= (remainder n 2) 0))
(define (square x) (* x x))

(define (expmod-alyssa base exp m)
        (remainder (fast-expt base exp) m))

(expmod 100000 100000 3)
(expmod-alyssa 100000 100000 3)
; the expmod-alyssa is much slower than expmod
