;;; Exercise 2.14
(load "ex2-8.scm")
(load "ex2-12.scm")
;(define (par1 r1 r2)
;    (div-interval
;        (mul-interval r1 r2)
;        (add-interval r1 r2)))
;(define (par2 r1 r2)
;    (let ((one (make-interval 1 1)))
;        (div-interval one (add-interval (div-interval one r1) (div-interval one r2)))))
;(make-interval 95 105)
;(par1 (make-interval 95 105) (make-interval 95 105))
;(par2 (make-interval 95 105) (make-interval 95 105))
(div-interval (make-center-percent 10 1) (make-center-percent 10 1))
(div-interval (make-center-percent 10 0.01) (make-center-percent 10 0.01))
(div-interval (make-center-percent 10 0.0001) (make-center-percent 10 0.0001))
