;;; Exercise 2.94
(define (great-common-divisor a b)
    (apply-generic 'greatest-common-divisor a b))

(define (gcd-terms a b)
    (if (empty-termlist? b)
        a
        (gcd-terms b (remainder-terms a b))))

(define (remainder-terms t1 t2)
    (cadr (div-terms t1 t2))) 
        
(define (gcd-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (make-poly (variable p1) 
                   (gcd-terms (term-list p1)
                              (term-list p2)))
        (error "not same variable" (list p1 p2))))
; polynomial package
(put 'great-common-divisor '(polynomial polynomial)
    ((lambda (a b) (tag (gcd-poly a b)))))
; scheme-number package
(put 'great-common-divisor '(scheme-number scheme-number)
    ((lambda (a b) (tag (gcd a b)))))
