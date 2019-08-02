;; Exercise 3.62
(load "3.5.scm")
(load "ex3-59.scm")
(load "ex3-60.scm")
(load "ex3-61.scm")

(define (div-series s1 s2)
  (if (zero? (stream-car s2))
      (error "denominator is zero")
  (mul-series s1 (invert-unit-series s2))))
(define tan-series (div-series sine-series cosine-series))
; test
(stream-ref tan-series 0)
(stream-ref tan-series 1)
(stream-ref tan-series 2)
(stream-ref tan-series 3)
(stream-ref tan-series 4)
(stream-ref tan-series 5)
;; tanx = x + 1/3x^3 + 2/15x^5 + ...

