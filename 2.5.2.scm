;; 2.5.2 Combining data of different types
;; a procedure for adding complex numbers to ordinary numbers
(define (add-complex-to-schemenum z x)
  (make-from-real-imag (+ (real-part z) x)
		       (imag-part z)))
(put 'add '(complex scheme-number)
     (lambda (z x)
       (tag (add-complex-to-schemenum z x))))
;; Coercion
(define (scheme-number->complex n)
  (make-complex-from-real-imag
    (contents n) 0))
(put-coercion 'scheme-number 'complex scheme-number->complex)
;; modify the apply-generic procedure
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
	(apply proc (map contents args))
	(if (= (length args) 2)
	  (let ((type1 (car type-tags))
		(type2 (cadr type-tags))
		(a1 (car args))
		(a2 (cadr args)))
	    (let ((t1->t2
		    (get-coercion type1 type2))
		  (t2->t1
		    (get-coercion type2 type2)))
	      (cond (t1->t2
		      (apply-generic op (t1->t2 a1) a2))
		    (t2->t1
		      (apply-generic op a1 (t2->t1 a2)))
		    (else
		      (error "No method for these types" (list op type-tags))))))
	(error "No method for thest types" (list op type-tags)))))))

