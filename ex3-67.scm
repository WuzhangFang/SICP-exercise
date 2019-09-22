;; Exercise 3.67
;; modify the pairs procedure so that (pairs integers integers) will produce
;; all pairs of integers.
(define (pairs s t)
    (cons-stream
      (list (stream-car s) (stream-car t))
      (interleave
        (stream-map (lambda (x)
                      (list (stream-car s) x))
                    (stream-cdr t))
        (pairs (stream-cdr s) t))))
