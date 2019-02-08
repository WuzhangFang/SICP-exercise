;; Exercise 3.20
(define x (cons 1 2))
(define z (cons x x))
(set-car! (cdr z) 17)
; (set-car! x 17)
; (set! (car x) 17)
