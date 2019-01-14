;;; To calculate the factorial
; recursive process
(define (factorial n)
    (if (= n 1) 1 (* n (factorial (- n 1)))))
(factorial 5)
; iterative process
(define (factorial-2 n)
    (define (iter product counter)
        (if (> counter n) 
            product
            (iter (* counter product) (+ counter 1))))
        (iter 1 1))
(factorial-2 6)
