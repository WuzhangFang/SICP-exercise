;;; Exercise 1.30
; linearly recursive
(define (sum-r term a next b)
    (if (> a b)
        0
        (+ (term a) (sum-r term (next a) next b))))

; iteratively
(define (sum-i term a next b)
    (define (iter a result)
        (if (> a b) 
            result
            (iter (next a) (+ result (term a)))))
    (iter a 0))
