;;; Exercise 2.6
; Church numerals
(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n) 
    (lambda (f) (lambda (x) (f ((n f) x)))))
;(add-1 zero)
;(lambda (f) (lambda (x) (f ((zero f) x))))
;(lambda (f) (lambda (x) (f ((lambda (x) x) x))))
;(lambda (f) (lambda (x) (f x)))
