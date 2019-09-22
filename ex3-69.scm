;; Exercise 3.69
(load "3.5.3.scm")
;; (s0 t0 u0) (s0 t0 u1) (s0 t0 u2) ...
;;            (s0 (pair t u))
(define (triples s t u)
    (cons-stream 
        (list (stream-car s) (stream-car t) (stream-car u))
        (interleave
          (stream-map (lambda (x) (list (stream-car s) (stream-car t) x))
                      (stream-cdr u))
          (interleave
            (stream-map (lambda (pair) (cons (stream-car s) pair))
                        (pairs (stream-cdr t) (stream-cdr u)))
            (triples (stream-cdr s) (stream-cdr t) (stream-cdr u))))))
(define (square x)
    (* x x))

(define (Pythagorean-triples)
    (stream-filter
        (lambda (s) (= (+ (square (car s)) (square (cadr s))) (caddr s)))
        (triples integers integers integers)))
