;;; Exercise 1.29
; Simpson's rule to do the integral
(load "even.scm")

(define (cube x) (* x x x))

(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))

; n should be an even number
(define (simpson-integral f a b n)
    (define h (/ (- b a) n))
    (define (y k) (f (+ a (* h k))))
    (define (factor k) 
            (cond ((or (= k 0) (= k n)) 1)
                  ((even? k) 2)
                  (else 4)))
    (define (next k) (+ 1 k))
    (define (term k) (* (factor k) (y k)))
    (* (/ h 3) (sum term 0 next n)))    

(simpson-integral cube 1 2 100)
