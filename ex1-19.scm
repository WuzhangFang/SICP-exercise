;;; Exercise 1.19
; Fibonacci number in a logarithmic number of steps
; T_{p,q}: a <- bq + aq + ap
;          b <- bp + aq
; T_{p,q}T_{p,q}: a <- b(2pq + q^2) + a(2pq + q^2) + a(p^2 + q^2)
;                 b <- b(p^2 + q^2) + a(2pq + q^2)
; q' = q^2 + 2pq
; p' = p^2 + q^2
(define (fib n)
    (iter 1 0 0 1 n))
(define (iter a b p q count)
    (cond ((= count 0) b)
          ((even? count) (iter a b (+ (* p p) (* q q)) (+ (* q q) (* 2 p q)) (/ count 2)))
          (else (iter (+ (* b q) (* a q) (* a p)) (+ (* b p) (* a q)) p q (- count 1)))))
(fib 5)
