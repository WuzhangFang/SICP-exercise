;;;Exercise 2.20 dotted-tail notation
(define (parity-check x y)
    (= (remainder x 2) (remainder y 2)))
(define (same-parity x . lst)
    (define (iter lst result)
        (if (null? lst) result
            (iter (cdr lst) 
                (if (parity-check x (car lst))
                    (append result (list (car lst)))
                    result))))
    (iter lst (list x)))
(same-parity 2 5 7 9 10 18)
