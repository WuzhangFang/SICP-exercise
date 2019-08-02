;; Exercise 3.61
(load "3.5.scm")
(load "ex3-59.scm")
(load "ex3-60.scm")
(define (invert-unit-series s)
  (define x
    (cons-stream 1 (scale-stream (mul-series x (stream-cdr s)) -1)))
x)
;; test
;(stream-ref cosine-series 2)
;(stream-ref (invert-unit-series cosine-series) 2)
