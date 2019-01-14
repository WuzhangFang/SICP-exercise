;;; Exercise 2.39
(define (reverse-right sequence)
    (fold-right (lambda (x y) (append y (list x))) `() sequence))

(define (reverse-left sequence)
    (fold-left (lambda (x y) (cons y x)) `() sequence))
; test
(reverse-right (list 1 2 3 4))
(reverse-left (list 1 2 3 4))
