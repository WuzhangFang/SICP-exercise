;;; Exercise 2.48
;; segment
; make-segment takes two vectors as arguments
(define (make-segment start-segment end-segment)
    (list start-segment end-segment))
(define (start-segment segment)
    (car segment))
(define (end-segment segment)
    (cadr segment))
