;; Exercise 2.96
;; a. modify the remainder-terms
;; t1: (term-list P)
;; t2: (term-list Q)
(define (pseudoremainder-terms t1 t2)
      (cadr (div-terms (mul-term-by-all-terms (integerize t1 t2) t1) t2)))
(define (integerize t1 t2)
  (expt (coeff (first-term t1)) (+ 1 (- (order (first-term t1))
					(order (first-term t2))))))
(define (gcd-terms a b)
  (if (empty-termlist? b)
    a
    (gcd-terms b (pseudoremainder-terms a b))))
;; b. 
(define (reduce-term-list t factor)
  (map (lambda (x) (make-term (order x)
			      (/ (coeff x) factor)))
       t))

