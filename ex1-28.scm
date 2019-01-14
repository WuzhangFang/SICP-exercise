;;; Exercise 1.28 Miller-Rabin test
(load "expmod.scm")
(define (expmod base exp m)
    (cond ((= exp 0) 1)
    ((nontrivial-square-root? base m) 0)
    ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
    (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (nontrivial-square-root? a n)
    (and (not (= a 1))
            (not (= a (- n 1)))
            (= 1 (remainder (square a) n))))

(define (mr-test n)
    (try-it (+ 1 (random (- n 1))) n))

(define (try-it a n) (= (expmod a (- n 1) n) 1))

(define (fast-prime? n times)
    (cond ((= times 0) true)
          ((mr-test n) (fast-prime? n (- times 1)))
          (else false)))


(fast-prime? 3 3)
