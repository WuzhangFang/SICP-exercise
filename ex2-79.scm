;; Exercise 2.79
;; define a generic equality predicate equ? that tests the equality
;; of two numbers (ordinary, rational, and complex)
;; scheme (ordinary) number
(load "apply-generic.scm")
(put 'equ? '(scheme-number scheme-number)
     (lambda (x y) (= x y)))
;; rational number
(put 'equ? '(rational rational)
     (lambda (x y) (and (= (numer x) (number y))
			(= (denom x) (denom y)))))
;; complex number
(put 'equ? '(complex complex)
     (lambda (x y) (and (= (magnitude x) (magnitude y))
			(= (angle x) (angle y)))))
(define (equ? x y)
  (apply-generic 'equ? x y))

