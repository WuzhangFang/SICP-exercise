;; Exercise 2.97
;; a.
(define (reduce-terms n d)
  (let* ((gcd (gcd-terms n d))
	 (integer-factor (integerize n d))
	 (nn (div-terms (mul-term-by-all-terms integer-factor n) gcd))
	 (dd (div-terms (mul-term-by-all-terms integer-factor d) gcd))
	 (factor (apply gcd (append (map coeff nn) (map coeff dd)))))
    (list (reduce-term-list nn factor)
	  (reduce-term-list dd factor))))
(define (reduce-poly p1 p2)
  (if (same-variable (variable p1) (variable p2))
    (let ((reduced-terms (reduce-terms (term-list p1)
				       (term-list p2))))
      (list (make-polynomial (variable p1) (car reduced-terms))
	    (make-polynomial (variable p1) (cadr reduced-terms))))
    (error "not same variable" (list p1 p2))))
;; b.
(define (reduce-integers n d)
  (let ((g (gcd n d)))
    (list (/ n g) (/ d g))))
(define (reduce n d)
  (apply-generic 'reduce n d))
;; polynomial package
(put 'reduce '(polynomial polynomial)
     (lambda (p1 p2) (map tag (reduce-poly p1 p2))))
;; scheme-number package 
(put 'reduce '(scheme-number scheme-number) 
     (lambda (n d) (map tag (reduce-integers n d))))

