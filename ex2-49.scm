;;; Exercise 2.49
; a. The painter that draws the outline of the designated frame
(define a (make-vect 0 0))
(define b (make-vect 0 1))
(define c (make-vect 1 1))
(define d (make-vect 1 0))
(define a-list
    (list (make-segment a b)
          (make-segment b c)
          (make-segment c d)
          (make-segment d a)))
; b. The painter that draws an "X" by connecting opposite corners of the frame
(define b-list
    (list (make-segment a c)
          (make-segment b d)))
; c. The painter that draws a diamond by connecting the midpoints of the sides of the frame
(define e (make-vect 0.0 0.5))
(define f (make-vect 0.5 1.0))
(define g (make-vect 1.0 0.5))
(define h (make-vect 0.5 0.0))
(define c-list
    (list (make-segment e f)
          (make-segment f g)
          (make-segment g h)
          (make-segment h e)))
; d. The wave painter
