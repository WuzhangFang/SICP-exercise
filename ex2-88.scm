;; Exercise 2.88
(define (negate x) (apply-generic 'negate x))
;; scheme-number package
(put 'negate 'scheme-number (lambda (x) (tag (- x))))
;; rational-number package
(put 'negate 'rational (lambda (x) (tag (make-rational (- (numer x) (denom x))))))
;; complex-number package
(put 'negate 'complex (lambda (z) (tag (make-from-real-imag (- (real-part z)) (- (imag-part z))))))
;; polynomial package
(define (negate-terms termlist)
  (map (lambda (t) (make-term (order t) (- (coeff t))))))
(put 'negate 'polynomial (lambda (p) (tag (make-polynomial (variable p) (negate-terms (term-list p))))))
(put 'sub '(polynomial polynomial) (lambda (p1 p2) (tag (add-poly p1 (negate p2)))))
