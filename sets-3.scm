;;; Exercise 2.3.3 Example: Representing Sets
; Sets as binary trees
; The valid representation is that all elements in the left subtree should be smaller than the node entry, 
; and all elements in the right subtree should be larger.
; representation:
; each node will be a list of three terms: entry at the node, the left subtree, the right subtree
(load "ex2-63.scm")
(load "sets-1.scm")
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))
; set operations
(define (element-of-tree? x set)
  (cond ((null? set) false)
	((= x (entry set)) true)
	((< x (entry set))
	 (element-of-tree? x (left-branch set)))
	((> x (entry set))
	 (element-of-tree? x (right-branch set)))))
(define (adjoin-tree x set)
  (cond ((null? set) (make-tree x '() '()))
	((= x (entry set)) set)
	((< x (entry set))
	 (make-tree (entry set) (adjoin-tree x (left-branch set)) (right-branch set)))
	((> x (entry set))
	 (make-tree (entry set) (left-branch set) (adjoin-tree x (right-branch set))))))
(define (intersection-tree set1 set2)
  (intersection-set (tree->list-2 set1)
		    (tree->list-2 set2)))
(define (union-tree set1 set2)
  (union-set (tree->list-2 set1)
	     (tree->list-2 set2)))
; test	
(define a (make-tree 7 (make-tree 3 (make-tree 1 '() '())
				    (make-tree 5 '() '()))
		       (make-tree 9 '() (make-tree 11 '() '()))))
(define b (make-tree 7 (make-tree 3 (make-tree 3 '() '())
				    (make-tree 6 '() '()))
		       (make-tree 9 '() (make-tree 11 '() '()))))
(intersection-tree a b)
(union-tree a b)
