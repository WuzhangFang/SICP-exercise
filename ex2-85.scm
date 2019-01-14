;; Exercise 2.85
;; simplify a data object by lowering its type in the tower
;; defining a generic operation 'project' that pushes an object
;; down in the tower
;; 'drop' procedure: drops an object as far as possible
(load "ex2-79.scm")  ; test the equality of two numbers
(load "ex2-83.scm")  ; raise
;; project operation
(define (project x) (apply-generic 'project x))
;; complex package
(put 'project '(complex)
     (lambda (z) (make-real (real-part z))))
;; real package
(put 'project '(real)
     (lambda (r) (let ((rat (rationalize (inexact->exact r) 1/100)))
		   (make-rat (numer rat) (denom rat)))))
;; rational package
(put 'project '(rational)
     (lambda (r) (make-scheme-number (floor (/ (numer r) (denom r))))))
;; drop procedure
(define (drop num)
  (let ((proj-proc (get 'project (type-tag num))))
    (if proj-proc
      (let ((dropped (proj-proc (contents num))))
	(if (equ? dropped (raise dropped)) ; if a num can be dropped?
	  (drop dropped)
	  num))
      num)))
