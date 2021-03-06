;;; Exercise 2.46
;; implement the vector representation
; constructor
(define (make-vect x y)
    (cons x y))
; selectors
(define (xcor-vect vect)
    (car vect))
(define (ycor-vect vect)
    (cdr vect))
; procedures: add-vect, sub-vect, scale-vect
(define (add-vect vect1 vect2)
    (make-vect
        (+ (xcor-vect vect1) (xcor-vect vect2))
        (+ (ycor-vect vect1) (ycor-vect vect2))))
(define (sub-vect vect1 vect2)
    (make-vect
        (- (xcor-vect vect1) (xcor-vect vect2))
        (- (ycor-vect vect1) (ycor-vect vect2))))
(define (scale-vect s vect)
    (make-vect
        (* s (xcor-vect vect))
        (* s (ycor-vect vect))))
