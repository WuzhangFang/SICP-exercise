;;; 1.3.3 Procedures as general methods
; Finding roots of equations by the half-interval method
(load "average.scm")
(define (close-enough? x y)
    (< (abs (- x y)) 0.001))
(define (negative? x)
    (< x 0))
(define (positive? x)
    (> x 0))

(define (search f neg-point pos-point)
    (let ((midpoint (average neg-point pos-point)))
        (if (close-enough? neg-point pos-point)
            midpoint
            (let ((test-value (f midpoint)))
                (cond ((positive? test-value)
                        (search f neg-point midpoint))
                      ((negative? test-value)
                        (search f midpoint pos-point))
                      (else midpoint))))))

(define (half-interval f a b)
    (let ((a-value (f a))
          (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
            (search f a b))
          ((and (negative? b-value) (positive? a-value))
            (search f b a))
          (else
            (error "values are not of opposite sign" a b)))))

(half-interval sin 2.0 4.0)
