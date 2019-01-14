;;; Exercise 2.70
(load "huffman-tree.scm")
(load "ex2-69.scm")
(load "ex2-68.scm")
(define alphabet '((BOOM 1) (WAH 1) (A 2) (GET 2) (JOB 2) (SHA 3) (YIP 9) (NA 16)))
(encode '(Get a job Sha na na na na na na na na) (generate-huffman-tree
						   alphabet))
