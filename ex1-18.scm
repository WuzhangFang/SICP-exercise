;;; Exercise 1.18
; similar to Exercise 1.16
; keep doing halve and double until b is odd and the invariant is a*b -> a+a*(b-1)
(define (even? n) (= (remainder n 2) 0))
(define (double n) (+ n n))
(define (halve n) (/ n 2))

(define (multi a b)
        (iter a b 0))

(define (iter a b sum)
        (cond ((= b 0) sum)
              ((even? b) (iter (double a) (halve b) sum))
              (else (iter a (- b 1) (+ a sum)))))          
(multi 2 3)
