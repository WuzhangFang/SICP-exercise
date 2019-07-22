;; Exercise 3.51
;; return its argument after printing it
(load "3.5.scm")
(define (show x)
  (display-line x)
  x)
(define x
  (stream-map 
    show
    (stream-enumerate-interval 0 10)))
(stream-ref x 5)
(stream-ref x 7)
