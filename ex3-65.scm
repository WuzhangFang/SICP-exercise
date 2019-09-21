;; Exercise 3.65
;; ln2 = 1 - 1/2 + 1/3 - 1/4 + ...
(load "3.5.scm")
(load "ex3-55.scm")
(define (ln2-summands n)
  (cons-stream 
    (/ 1.0 n)
    (stream-map - (ln2-summands (+ n 1)))))
(define ln2
  (partial-sums (ln2-summands 1)))
(show-stream ln2 20)           
