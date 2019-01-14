;;; Fibonacci
; recursive process
(define (fib1 n)
    (cond ((= n 0) 0)
          ((= n 1) 1)
          (else (+ (fib1 (- n 1)) (fib1 (- n 2))))))
(fib1 5)
; iterative process
(define (fib2 n)
    (iter 1 0 n))
(define (iter a b count)
    (if (= count 0) b
        (iter (+ a b) a (- count 1))))
(fib2 5)
