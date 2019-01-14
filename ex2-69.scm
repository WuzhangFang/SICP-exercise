;;; Exercise 2.69
(load "huffman-tree.scm")
; make-leaf-set: transforms the list of pairs into an ordered set of leaves
(define sample-pair '((A 4) (B 2) (C 1) (D 1)))
(make-leaf-set sample-pair)
(length (make-leaf-set sample-pair))
(define (generate-huffman-tree pairs)
  (successive-merge
    (make-leaf-set pairs)))
(define (successive-merge leaf-set)
  (cond ((= 0 (length leaf-set)) '())
	((= 1 (length leaf-set)) (car leaf-set))
	(else (successive-merge (adjoin-set (make-code-tree
						   (car leaf-set)
						   (cadr leaf-set))
						 (cddr leaf-set))))))
(generate-huffman-tree sample-pair)
