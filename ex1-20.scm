;;; Exercise 1.20
(define (gcd a b)
    (if (= b 0) a
        (gcd b (remainder a b))))
; the applicative-order-evaluation 4 times of using remainder.
; the normal-order-evaluation uses more time of remainder starting from the if.
