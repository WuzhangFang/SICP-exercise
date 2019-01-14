;;; Exercise 2.56
; add one kind of differentiation rule to calculate the derivative of u^n
(define (deriv expr var)
  (cond ((number? expr) 0)
	((variable? expr) 
	 (if (same-variable? expr var) 1 0))
	((sum? expr)
	 (make-sum (deriv (addend expr) var)
		   (deriv (augend expr) var)))
	((product? expr)
	 (make-sum
	   (make-product
	     (multiplier expr)
	     (deriv (mupliplicand expr) var))
	   (make-product
	     (deriv (multiplier expr) var)
	     (multiplicand expr))))
	((exp? expr)
	 (make-product 
	   (exponent expr) 
	   (make-product 
	     (make-exponention 
	       (base expr) 
	       (- (exponent expr) 1)) 
	     (deriv (base expr) var))))
	(else (error "unknown expression type: DERIV" expr))))


