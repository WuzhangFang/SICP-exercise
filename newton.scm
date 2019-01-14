; Newton's method
(load "fixed-point.scm")
(load "square.scm")
(define (deriv g) 
    (lambda (x) 
        (/ (- (g (+ x dx)) (g x)) dx)))

(define dx 0.00001)
(define (newton-transform g) (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newton-method g guess)
    (fixed-point (newton-transform g) guess))

;(define (sqrt x) (newton-method (lambda (y) (- (square y) x)) 1.0))

;(sqrt 4.0)
