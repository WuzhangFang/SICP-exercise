;; 3.5.3 Exploiting the stream paradigm
(load "3.5.scm")
(load "ex3-55.scm")
(load "average.scm")

; sqrt procedure using stream
(define (sqrt-improve guess x)
  (average guess (/ x guess)))
(define (sqrt-stream x)
  (define guesses
    (cons-stream 
      1.0 (stream-map
            (lambda (guess)
              (sqrt-improve guess x))
            guesses)))
  guesses)
(show-stream (sqrt-stream 2) 10)

; pi
(define (pi-summands n)
  (cons-stream
   (/ 1.0 n)
   (stream-map - (pi-summands (+ n 2)))))
(define pi-stream
  (scale-stream
   (partial-sums (pi-summands 1)) 4))
(show-stream pi-stream 10)
(define (stream-append s1 s2)
    (if (stream-null? s1)
        s2
        (cons-stream
          (stream-car s1)
          (stream-append (stream-cdr s1) s2))))
(define (interleave s1 s2)
    (if (stream-null? s1)
        s2
        (cons-stream
          (stream s1)
          (interleave s2 (stream-cdr s1)))))
(define (pairs s t)
    (cons-stream
      (list (stream-car s) (stream-car t))
      (interleave
        (stream-map (lambda (x)
                        (list (stream-car s) x))
                    (stream-cdr t))
      (pairs (stream-cdr s) (stream-cdr t)))))
