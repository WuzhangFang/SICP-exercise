;;; Exercise 1.35
; show that the golden ratio is the transformation x -> 1 + 1/x
(load "fixed-point.scm")
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
