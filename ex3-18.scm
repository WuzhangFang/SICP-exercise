;; Exercise 3.18
(load "ex3-13.scm")
(define (loop? list)
  (define auxiliary-lst '())
  (define (iter x)
    (if (pair? x)
      (if (memq x auxiliary-lst)
	#t
	(begin 
	  (set! auxiliary-lst (cons x auxiliary-lst))
	  (iter (cdr x))))
      #f))
  (iter list))
; test
(define lst1 (list 1 2 3))
(loop? lst1)
(loop? (make-cycle lst1))
