;; Exercise 2.80
;; define a generic equality predicate equ? that tests the equality
;; of two numbers (ordinary, rational, and complex)
;; scheme (ordinary) number
(load "apply-generic.scm")
(put '=zero? '(scheme-number)
     (lambda (x) (= 0 x)))
;; rational number
(put '=zero? '(rational)
     (lambda (x) (= 0 (numer x))))
;; complex number
(put 'equ? '(complex)
     (lambda (z) (= 0 (magnitude z))))
(define (=zero? x) 
  (apply-generic '=zero? x))

