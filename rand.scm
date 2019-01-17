(define (rand-update x)
    (let ((m (expt 2 31))
          (a 11035)
          (b 12345))
        (modulo (+ (* a x) b) m)))

(define random-init 1.0)

(define rand
    (let ((x random-init))
        (lambda () (set! x (rand-update x)) x)))
(rand)
(rand)
(rand)
(rand)
