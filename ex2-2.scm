;;; Exercise 2.2 representing line segments in a plane
(load "average.scm")
(define (make-segment s e)
    (cons s e))
(define (start-segment x) (car x))
(define (end-segment x) (cdr x))

(define (make-point x y)
    (cons x y))
(define (x-point x) (car x))
(define (y-point x) (cdr x))

(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))

(define (midpoint-segment segment)
    (let ((start (start-segment segment))
          (end (end-segment segment)))
    (make-point (average (x-point start) (x-point end))
                (average (y-point start) (y-point end)))))

;(print-point (midpoint-segment (make-segment (make-point 1.0 3.0) (make-point 4.0 3.0))))
