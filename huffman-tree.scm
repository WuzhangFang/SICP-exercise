;;; 2.3.4 Example: Huffman Encoding Tree
;representing Huffman tree
; leaves of the tree
(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))
; a general tree will be a list of a left branch,
; a right branch, a set of symbols, and a weight.
(define (make-code-tree left right)
  (list left
	right
	(append (symbols left)
		(symbols right))
	(+ (weight left) (weight right))))
(define (symbols tree)
  (if (leaf? tree)
    (list (symbol-leaf tree))
    (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
    (weight-leaf tree)
    (cadddr tree)))
(define (left-branch tree)
  (car tree))
(define (right-branch tree)
  (cadr tree))
; the decoding procedure: takes a list of zeros and ones, and a Huffman tree
; start from the root, each time we come to a leaf, we have generated a symbol
(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
      '()
      (let ((next-branch
	      (choose-branch
		(car bits)
		current-branch)))
	(if (leaf? next-branch)
	  (cons
	    (symbol-leaf next-branch)
	    (decode-1 (cdr bits) tree))
	  (decode-1 (cdr bits)
		    next-branch)))))
  (decode-1 bits tree))
(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
	((= bit 1) (right-branch branch))
	(else (error "bad bit:
		     CHOOSE-BRANCH" bit))))
(define (adjoin-set x set)
  (cond ((null? set) (list x))
	((< (weight x) (weight (car set)))
	 (cons x set))
	(else
	  (cons (car set)
		(adjoin-set x (cdr set))))))
(define (make-leaf-set pairs)
  (if (null? pairs)
    '()
    (let ((pair (car pairs)))
      (adjoin-set
	(make-leaf (car pair)
		   (cadr pair))
	(make-leaf-set (cdr pairs))))))

