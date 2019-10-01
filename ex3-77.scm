;; Exercise 3.77
(define (integral delayed-integrand initial-value dt)
    (cons-stream
      (let ((integrand 
             (force delayed-integrand)))
      initial-value
      (if (stream-null? integrand)
          the-empty-stream
          (integral
            (delay (stream-cdr integrand))
            (+ (* dt (stream-car integrand))
               initial-value)
            dt)))))
