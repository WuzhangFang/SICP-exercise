;; Exercise 3.19
(load "ex3-13.scm")
; cdrs and cddrs will eventually meet with each other if there is a loop
(define (loop? xs)
  (define (seen-last-pair? x)
    (or (null? x) (null? (cdr x))))
  (define (chase turtle rabbit)
    (cond ((or (null? turtle) (null? rabbit)) #f)
	  ((eq? (car turtle) (car rabbit)) #t)
	  ((seen-last-pair? (cdr rabbit)) #f)
	  (else (chase (cdr turtle) (cddr rabbit)))))
  (if (seen-last-pair? xs)
    #f
    (chase xs (cdr xs))))
(define lst1 (list 1 2 3))
(loop? lst1)
(loop? (make-cycle lst1))
