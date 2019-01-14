;; Exercise 2.74
;; a.
(define (get-record name file)
  ((get 'get-record (type-tag file)) name (contents file)))
;; b.
(define (get-salary name file)
  ((get 'get-salary (type-tag file)) name (contents file)))
;; c.
(define (has-record? name file)
  ((get 'has-record? (type-tag file)) name (contents file)))
(define (find-employee-record name files-lst)
  (cond ((null? files-lst) (error "no name in record: " name))
	((has-record? name (car files-lst))
	 (get-record  name (car files-lst)))
	(else (find-employee-record name (cdr files-lst)))))


