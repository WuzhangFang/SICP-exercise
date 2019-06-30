;; Exercise 3.39
(define x 10)
(define s (make-serializer))
(parallel-excute
  (s (lambda () (set! x (* x x))))
  (s (lambda () (set! x (+ x 1)))))
; gives 101 or 121

(parallel-excute 
  (lambda ()
    (set! x ((s (lambda () (* x x))))))
  (s (lambda () (set! x (+ x 1)))))
; 11 is not allowed here
