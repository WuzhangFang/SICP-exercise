;; Exercise 2.83
;; integer->rational->real->complex
(load "apply-generic.scm")
(define (raise x) (apply-generic 'raise x))
;; integer package
(put 'raise '(integer) (lambda (n) (make-rational n 1)))
;; rational package
(put 'raise '(rational) (lambda (n) (make-real (/ (number n) (denom n)))))
;; real package
(put 'raise '(real) (lambda (n) (make-complex-from-real-imag n 0)))
;; the procedure make-* could be defined as follows:
(define (make-complex-from-real-imag x y)
  ((get 'make-from-real-imag 'complex) x y))
