;;; Exercise 1.22
(load "smallest-divisor.scm")
(load "prime.scm")
(load "even.scm")

(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
    (display "***")
    (display elapsed-time))

(define (next-odd n)
    (if (even? n) (+ 1 n) (+ 2 n))) 

(define (search-for-primes n count)
    (cond ((= count 0) (newline) (display "done"))
          ((prime? n) (timed-prime-test n) (search-for-primes (next-odd n) (- count 1)))
          (else (search-for-primes (next-odd n) count))))             
 
;(search-for-primes 100000000 3)
