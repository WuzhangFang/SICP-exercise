;; Exercise 3.63
;; original version
(define (sqrt-stream x)
  (define guesses
    (cons-stream
     1.0 (stream-map
           (lambda (guess) (sqrt-improve guess x))
           guesses)))
  guesses)
;; Louis Reasoner's solution
(define (sqrt-stream x)
  (cons-stream
   1.0
   (stream-map (lambda (guess) (sqrt-improve guess x))
               (sqrt-stream x))))
