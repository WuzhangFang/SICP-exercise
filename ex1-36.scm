;;; Exercise 1.36 
; modify the fixed-point method
(load "average.scm")

(define tolerance 0.00001)
(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess step)
        (display "Step: ")
        (display step)
        (newline)
        (display "Guess: ")
        (display guess)
        (newline)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next (+ 1 step)))))
    (try first-guess 1))

(define fixed-log (lambda (x) (/ (log 1000) (log x))))
(define damped-log (lambda (x) (average x (fixed-log x))))
(fixed-point fixed-log 2.0) ; 34 steps
(fixed-point damped-log 2.0) ; 9 steps
