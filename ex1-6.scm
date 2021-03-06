;;; Exercise 1.6
(load "square.scm")
(define (new-if predicate then-clause else-clause)
	(cond (predicate then-clause)
	      (else else-clause)))

(define (good-enough? guess x)
	(< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
	(average guess (/ x guess)))

(define (average x y) 
	(/ (+ x y) 2))

(define (abs x)
	(if (< x 0)
	    (- x)
	    x))

(define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
	    guess
	    (sqrt-iter (improve guess x) x)))

(define (sqrt x)
	(sqrt-iter 1.0 x))

(sqrt 3)
