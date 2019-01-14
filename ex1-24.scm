;;; Exercise 1.24
; Use fast-prime? instead of prime?
(load "ex1-22.scm")
(load "fast-prime.scm")

(define (start-prime-test n start-time)
    (if (fast-prime? n 3)
        (report-prime (- (runtime) start-time))))
(search-for-primes 100000000 3)
