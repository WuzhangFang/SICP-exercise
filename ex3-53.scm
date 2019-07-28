;; Exercise 3.53
(define s (cons-stream 1 (add-streams s s)))
; s(n) = s(n-1) + s(n-1)
; s(1) = 1
; s(2) = s(1) + s(1) = 2
; s(3) = s(2) + s(2) = 4
