;;; Exercise 2.13
;assuming tolenrance is small
(define (mul-percent x y)
    (make-center-percent (* (center x) (center y)) (+ (percent x) (percent y))))
