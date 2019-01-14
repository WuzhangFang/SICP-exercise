;;; Exercise 2.37
; vector as a sequence of numbers
; matrix as a sequence of vectors
(load "sequence-operations.scm")

(define (dot-product v w)
    (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
    (map (lambda (row) (dot-product row v)) m))

(define (transpose m)
    (accumulate-n cons `() m))
; each row of matrix m * the transpose of matrix n
(define (matrix-*-matrix m n)
    (let ((cols (transpose n)))
        (map (lambda (row) (matrix-*-vector cols row)) m)))    
;;;test
(define v `(1 2 3 4))
(define m `((1 2 3 4) (4 5 6 6) (6 7 8 9)))
(matrix-*-vector m v)
(transpose m)
(define a (list (list 14 9 3) (list 2 11 15) (list 0 12 17) (list 5 2 3)))
(define b (list (list 12 25) (list 9 10) (list 8 5)))
(matrix-*-matrix a b)
