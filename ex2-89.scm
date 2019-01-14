;; Exercise 2.89
;; another representation for dense polynomials
(define (the-empty-termlist) '())
(define (empty-termlist? term-list) (null? term-list))
;; what we need to change are first-term and adjoin-term
(define (first-term term-list)
  (make-term (- (length term-list) 1) (car term-list))) ; the order of first term is length-1
(define (rest-terms term-list) (cdr term-list))
(define (adjoin-term term term-list)
  (cond ((=zero? term) term-list)
	((= (order term) (length term-list)) (cons (coeff term) term-list))
	(else (adjoin-term term (cons 0 term-list)))))
