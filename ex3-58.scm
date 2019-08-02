;; Exercise 3.58
(load "3.5.scm")
(define (expand num den radix)
  (cons-stream
   (quotient (* num radix) den)
   (expand (remainder (* num radix) den)
           den
           radix)))
(define s1 (expand 1 7 10))
(stream-ref s1 1) 
(stream-ref s1 2) 
(stream-ref s1 3) 
(stream-ref s1 4) 
(stream-ref s1 5) 
; the stream contains digits of 1/7
