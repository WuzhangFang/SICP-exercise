;;; Exercise 1.12 
; Pascal's triangle: calculate the element (row, col)
(define (pascal n m)
    (cond 
        ((< n m) (error "row should be greater than col"))
        ((or (= m 1) (= n m)) 1)
        (else  (+ (pascal (- n 1) (- m 1)) (pascal (- n 1) m)))))
(pascal 5 1)
(pascal 5 5)
(pascal 5 3)
