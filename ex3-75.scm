;; Exercise 3.75
(load "ex3-74.scm")
;; Louis Reasoner's solution
(define (make-zero-crossings input-stream last-value x)
    (let ((avpt
            (/ (+ (stream-car input=stream) last-value) 2)))
        (cons-stream
            (sign-change-detector avpt last-value)
            (make-zero-crossings (stream-cdr input-stream) avpt))))
;;
(define (make-zero-crossings input-stream last-value last-avpt)
    (let ((avpt
            (/ (+ (stream-car input=stream) last-value) 2)))
        (cons-stream
            (sign-change-detector avpt last-avpt)
            (make-zero-crossings (stream-cdr input-stream) (stream-car input-stream) avpt))))
