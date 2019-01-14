;;; Exercise 1.33
(define (filtered-accumulate filter combiner null-value term a next b)
    (cond ((> a b) null-value)
          ((filter a) (combiner (term a) (filtered-accumulate filter combiner null-value term (next a) next b)))
          (else (combiner null-value (filtered-accumulate filter combiner null-value term (next a) next b)))))

; a. the sum of the squares of the prime numbers in the interval a to b
(load "square.scm")
(load "prime.scm")
(load "inc.scm")
(define (sum-of-square-prime a b)
    (if (= a 1) 
        (filtered-accumulate prime? + 0 square (inc a) inc b)
        (filtered-accumulate prime? + 0 square a inc b)))
(sum-of-square-prime 1 5)

; b. find integers i where 0<i<n such that GCD(i,n)=1
(load "identity.scm")
(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

(define (relative-prime? m n)
    (= (gcd m n) 1))

(define (product-relative-prime n)
    (define (filter x)
        (relative-prime? x n))
    (filtered-accumulate filter * 1 identity 1 inc n))

(product-relative-prime 10)       
