;;; Exercise 1.11
; recursive process
(define (f n) 
    (if (< n 3) n (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))
(f 3)
; Value: 4 
(f 4)
; Value: 11

; iterative process
;(define (iter a b c count)
;    (if (= count 0) c
;        (iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
;(define (f n)
;    (iter 2 1 0 n))
;(f 3)
; Value: 4
;(f 4)
; Value: 11
