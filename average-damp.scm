(load "average.scm")
(define (average-damp f)
    (lambda (x)
        (average x (f x))))
;(define average-damp
;    (lambda (f)
;        (lambda (x) (average x (f x)))))
