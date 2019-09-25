;; Exercise 3.73
(load "3.5.scm")

(define (integral integrand initial-value dt)
    (define int
      (cons-stream
        initial-value
        (add-streams (scale-stream integrand dt)
                    int)))
int)


(define (RC R C dt)
    (lambda (i v0)
       (add-streams (scale-stream i R)
                    (scale-stream (integral i v0 dt) (/ 1 C)))))
(define RC1 (RC 5 1 0.5))
(define voltage1 (RC1 integers 1))
(show-stream voltage1 10)
