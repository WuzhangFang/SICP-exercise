;;; Exercise 1.37
; recursive
(define (cont-frac-rec n d k)
    (define (iter i)
        (if (= k i)
            (/ (n k) (d k))
            (/ (n i) (+ (d i) (iter (+ i 1))))))
    (iter 1))

(define (golden-ratio-rec k)
    (/ 1.0 (cont-frac-rec (lambda (i) 1.0) (lambda (i) 1.0) k)))

(golden-ratio-rec 12)

; iterative: from the back to the front
(define (cont-frac-iter n d k)
    (define (iter i result)
        (if (= i 0)
            result
            (iter (- i 1) (/ (n i) (+ (d i) result)))))
    (iter (- k 1) (/ (n k) (d k))))

(define (golden-ratio-iter k)
    (/ 1.0 (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) k)))

(golden-ratio-iter 12)
