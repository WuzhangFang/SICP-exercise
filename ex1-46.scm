;;; Exercise 1.46
(load "average.scm")
(load "square.scm")
(define (iterative-improve good-enough? improve-guess)
    (lambda (x) 
        (if (good-enough? x)
            x
            ((iterative-improve good-enough? improve-guess) (improve-guess x)))))
(define (sqrt-1 x)
    ((iterative-improve (lambda (y) (< (abs (- (square y) x)) 0.001))
                        (lambda (y) (average y (/ x y)))) 1.0))
(sqrt-1 5.0)
