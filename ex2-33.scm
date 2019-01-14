;;; Exercise 2.33
(load "sequence-operations.scm")

;(define (map-list proc items)
;    (if (null? items)
;        `()
;        (cons (proc (car items))
;              (map-list proc (cdr items)))))
;
;(define (accumulate operation initial sequence)
;     (if (null? sequence) initial
;         (operation (car sequence) (accumulate operation initial (cdr sequence)))))

(define (map-1 p sequence)
    (accumulate (lambda (x y) (cons (p x) y) ) `() sequence))

;(map-1 square (list 1 2 3 4))

(define (append-1 seq1 seq2)
    (accumulate cons seq2 seq1))
;(append-1 (list 1 2 3) (list 4 5 6))

; operation will take the x=(car sequence) and y=(accumulate operation initial (cdr sequence))
(define (length-1 sequence)
    (accumulate (lambda (x y) (+ 1 y)) 0 sequence))
;(length-1 (list 1 2 3 4)))
