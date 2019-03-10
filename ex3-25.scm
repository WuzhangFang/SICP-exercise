;; Exercise 3.25
;; http://www.giovannisfois.net/content/sicp-exercise-325
(define (make-table)
  (let ((local-table (list '*table*)))

(define (assoc key records)
  (cond ((null? records) false)
	((equal? key (caar records)) (car records))
	(else (assoc key (cdr records)))))

(define (lookup key-list)
  (lookup-iter key-list local-table))

(define (lookup-iter key-list table)
  (if (null? key-list)
    (cdr table)
    (let ((record (assoc (car key-list) (cdr table))))
      (if record
	(lookup-iter (cdr key-list) record)
	false))))

(define (insert! key-list value)
  (insert-iter! key-list value local-table))

(define (insert-iter! key-list value table)
  (let ((record (assoc (car key-list) (cdr table))))
    (if record
      (if (null? (cdr key-list))
	(set-cdr! record value)
	(insert-iter! (cdr key-list) value record))
      (begin (set-cdr! table (cons (list (car key-list)) (cdr table)))
	     (insert-iter! key-list value table)))
    'ok))

(define (dispatch m)
  (cond ((eq? m 'lookup-proc) lookup)
	((eq? m 'insert-proc!) insert!)
	(else (error "Unknown operation -- TABLE" m))))
dispatch))
; test
(define operation-table (make-table))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))

(put (list 'a 'a 1) 1)
(get (list 'a 'a 1))
(put (list 'a 'b 2) 2)
(get (list 'a 'b 2))
(put (list 'a 'a 1) 3)
(get (list 'a 'a 1))
