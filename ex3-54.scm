;; Exercise 3.54
(load "3.5.scm")
(define (mul-streams s1 s2)
  (stream-map * s1 s2))
(define (add-streams s1 s2)
  (stream-map + s1 s2))
(define integers 
  (cons-stream 1 (add-streams ones integers)))
(define factorials
  (cons-stream 1 (mul-streams (stream-cdr integers) factorials)))
