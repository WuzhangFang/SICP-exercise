;;; Exercise 1.15
(define (abs x) (if (< x 0) -x x))
(define (cubic x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cubic x))))
(define (sine angle) (if (not (> (abs angle) 0.1)) angle (p (sine (/ angle 3.0)))))
(sine 12.15) 
; Value: -.39980345741334
; The real value is -40.444382284
