;; Exercise 2.91
;; (x^5-1)/(x^2-1): quotient (x^3+x), remainder (x-1)
;; div-terms takes two term-lists as arguments, and return a term-list of
;; quotient and remainder.
(define (div-terms L1 L2)
  (if (empty-termlist? L1)
    (list (the-empty-termlist) (the-empty-termlist))
    (let ((t1 (first-term L1))    ; quotient
	  (t2 (frist-term L2)))   ; remainder
      (if (> (order t2) (order t1))
	(list (the-empty-termlist) L1)
	(let ((new-c (div (coeff t1) (coeff t2)))
	      (new-o (- (order t1) (order t2)))
	      (let ((rest-of-results
		      (div-terms (sub-terms 
				   L1
				   (mul-term-by-all-terms
				     (make-term new-o new-c) L2))
				 L2)))
		(list (adjoin-term 
			(make-term new-o new-c) (car rest-of-results))
		      (cadr rest-of-results)))))))))
(define (div-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
    (map (lambda (t)
	   (make-poly (variable p1) t))
	 (div-terms (term-list p1) (term-list p2)))
    (error "")))

