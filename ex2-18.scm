;;;Exercise 2.18
(define (reverse-1 lst)
    (define (reverse-iter rest result)
        (if (null? rest)
            result
            (reverse-iter (cdr rest) (cons (car rest) result))))
     (reverse-iter lst (list)))
(reverse-1 (list 1 2 3 4))
