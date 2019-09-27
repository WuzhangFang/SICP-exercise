;; Exercise 3.74
;; Alyssa's solution
;; sense-data: from sensor as a stream
;; zero-crossings: corresponding stream
(define (make-zero-crossings
            input-stream last-value)
    (cons-stream
      (sign-change-detector (stream-car input-stream)
                            last-value)
      (make-zero-crossings
        (stream-cdr input-stream)
        (stream-car input-stream))))
(define zero-crossings
    (make-zero-crossings sense-dat 0))
;; modified version
(define zero-crossings
    (stream-map signal-change-detector
                sense-data
                (cons-stream 0 sense-data)))
