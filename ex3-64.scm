;; Exercise 3.64
(define (stream-limit s tolerance)
  (if (< (abs (- (stream-car s) (stream-car (stream-cdr s)))) tolerance)
  (stream-car (stream-cdr s))
  (stream-limit (stream-cdr s) tolerance)))
