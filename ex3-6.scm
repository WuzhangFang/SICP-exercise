;; Exercise 3.6
(define (rand-update x)
    (let ((m 127)
          (a 32)
          (b 28))
        (modulo (+ (* a x) b) m)))

(define rand
    (let ((x 0))
        (define (generate)
            (set! x (rand-update x)) x)
        (define (reset n)
            (set! x n))
        (define (dispatch m)
            (cond ((eq? m 'generate) (generate))
                  ((eq? m 'reset) reset)
                  (else (error "no such method" m))))
dispatch))
;; test
(rand 'generate)
(rand 'generate)
((rand 'reset) 10)
(rand 'generate)
(rand 'generate)
((rand 'reset) 10)
(rand 'generate)

