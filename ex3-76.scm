;; Exercise 3.76
;; modified version
(define (smooth stream)
    (stream-map 
        (lambda (x y) (/ (+ x y) 2))
        (stream (cons-stream 0 stream))))
(define (make-zero-crossings input-stream)
    (stream-map sign-change-detecor (smooth input-stream)
                                    (cons-stream 0 (smooth input-stream))))
