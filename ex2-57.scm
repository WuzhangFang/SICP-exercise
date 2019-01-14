;;; Exercise 2.57
; modify make-sum and make-product only to include more terms
; for example, the addend of a sum would be the first term
; and the augend would be the sum of the rest of the terms
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
	     (deriv (multiplicand expr) var))
	   (make-product
	     (deriv (multiplier expr) var)
	     (multiplicand expr))))
	(else (error "unknown expression type: DERIV" expr))))
; representation
(define (addend s) (cadr s))
; '(+ x y z)
(define (augend s) 
  (if (> (length s) 3) 
    (cons '+ (cddr s))
    (caddr s)))
(define (multiplier p) (cadr p))
(define (multiplicand p) 
  (if (> (length p) 3)
    (cons '* (cddr p))
    (caddr p)))
(define (make-sum a1 a2) 
  (cond ((=number? a1 0) a2)
	((=number? a2 0) a1)
	((and (number? a1) (number? a2)) (+ a1 a2))
	(else (list '+ a1 a2))))
(define (make-product m1 m2)
  (cond ((or (=number? m1 0)
	     (=number? m2 0))
	 0)
	((=number? m1 1) m2)
	((=number? m2 1) m1)
	((and (number? m1) (number? m2)) (* m1 m2))
	(else (list '* m1 m2))))
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))
(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
(define (=number? expr num)
  (and (number? expr) (= expr num)))
;test
(deriv '(+ x 3) 'x)
(deriv '(* x y) 'x)
(deriv '(* x y (+ x 3)) 'x)
