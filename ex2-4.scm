;;; Exercise 2.4
(define (cons-1 x y) (lambda (m) (m x y)))
(define (car-1 z) (z (lambda (p q) p)))
(define (cdr-1 z) (z (lambda (p q) q)))

(car-1 (cons-1 2 3))
(cdr-1 (cons-1 2 3))

;(car (cons 1 2))
;(car (lambda (m) (m 1 2)))
;(lambda (m) (m 1 2) (lambda (p q) p))
;((lambda (p q) p) 1 2)
;1
