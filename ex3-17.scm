;; Exercise 3.17
; wrong version from ex3-16.scm
;(define (count-pairs x)
;  (if (not (pair? x))
;    0
;    (+ (count-pairs (car x))
;       (count-pairs (cdr x))
;       1)))
(define (count-pairs x)
  (define auxiliary-lst '())
  (define (iter x)
    (if (and (pair? x) (not (memq x auxiliary-lst)))
      (begin
	(set! auxiliary-lst (cons x auxiliary-lst))
	(+ (iter (car x))
	   (iter (cdr x))
	   1))
      0))
  (iter x))
;test
(define lst1 (list 1 2 3))
lst1
(count-pairs lst1)

(define lst2 (cons (list 1 2) (list 3 4)))
lst2
(count-pairs lst2)
; the number of pairs should be counted as the number of cons
; one (list 1 2) contains two pairs of cons
