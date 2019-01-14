;;; Exercies 1.8
;;; Cubic roots
(load "square.scm")
(define (triple x) (* x x x))

(define (good-enough? guess x)
	(< (abs (- (triple guess) x)) 0.001))

(define (improve guess x)
	(/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (average x y) 
	(/ (+ x y) 2))

(define (abs x)
	(if (< x 0)
	    (- x)
	    x))

(define (cubic-iter guess x)
    (if (good-enough? guess x)
	    guess
	    (cubic-iter (improve guess x) x)))

(define (cubic x)
	(cubic-iter 1.0 x))

(cubic 1000)
