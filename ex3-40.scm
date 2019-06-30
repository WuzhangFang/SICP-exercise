;; Exercise 3.40
(define x 10)
(parallel-excute
  (lambda () (set! x (* x x)))
  (lambda () (set! x (* x x x))))
; gives 101 or 121
(define s (make-serializer))
(parallel-excute
  (s (lambda () (set! x (* x x))))
  (s (lambda () (set! x (* x x x)))))
