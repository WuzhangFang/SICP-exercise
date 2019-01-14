;;; Exercise 2.72
(load "huffman-tree.scm")
(load "ex2-69.scm")
(load "ex2-68.scm")
(define alphabet '((A 1) (B 2) (C 4) (D 8) (E 16) (F 32)))
; least frequent symbol: A
(encode '(A) (generate-huffman-tree alphabet))
; most frequent symbol: F
(encode '(F) (generate-huffman-tree alphabet))

