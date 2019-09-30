;; Exercise 3.80
(load "3.5.scm")

(define (RLC R L C dt)
    (lambda (v0 i0)
        (define vc
            (integral (delay (scale-stream il (/ -1 C)))
                      v0 dt))
        (define il
            (integral (delay (add-streams
                        (scale-stream vc (/ 1 L))
                        (scale-stream il (- (/ R L)))))
                      i0 dt))
    (pairs vc il)))
