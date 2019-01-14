;; Exercise 2.92
;; https://github.com/vranga/SICP/
;; !!! donnot understand and move on first
(define (convert-poly poly var)
  (cond ((empty-termlist? (term-list poly)) ; if the polynomial is empty
         (make-poly var (the-empty-termlist)))
        ((equal? (variable poly) var)       ; same variable
         poly)
        ((empty-termlist? (rest-terms (term-list poly))) ; if only one term
         (let ((the-term (first-term (term-list poly))))
           (cond ((is-poly? (coeff the-term))
                  (let ((cip (convert-polynomial (coeff the-term) var)))
                    (let ((cip-rest-terms-poly (rest-terms-part-poly cip))
                          (cip-first-term-order (order (first-term (term-list cip))))
                          (cip-first-term-coeff (coeff (first-term (term-list cip)))))
                      (add
                        (make-poly
                          var
                          (make-poly-sparse-terms
                            (list (list
                                    cip-first-term-order
                                    (make-poly
                                      (variable p)
                                      (make-poly-sparse-terms
                                        (list (list (order the-term) cip-first-term-coeff))))))))
                        (convert-polynomial
                          (make-poly
                            (variable p)
                            (make-poly-sparse-terms
                              (list (list (order the-term) cip-rest-terms-poly)))) var))))))))
        (else   ; more than more terms
          (add (convert-polynomial
                 (make-poly (variable poly)
                            (make-poly-sparse-terms
                              (list (contents (first-term (term-list p))))))
                 var)
               (convert-poly
                 (make-poly (variable poly)
                            (rest-terms (term-list poly)))
                 var)))
    )
)
