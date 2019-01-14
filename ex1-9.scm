;;; Exercise 1.9
; in order to be different with '+', we redefine 'plus' function.
; first one
(define (plus a b)
    (if (= a 0) b (inc (plus (dec a) b))))

; second one: 
(define (plus a b)
    (if (= a 0) b (plus (dec a) (inc b))))
