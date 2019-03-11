;; Exercise 3.26
;; http://www.giovannisfois.net/content/exercise-326

(define (make-table)
  (let ((local-table (list '*table*)))

    (define (assoc key records)
      (cond ((null? records) false)
	    ((symbol<? key (caar records)) false) ;keys are sorted
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

    (define (find-insert-point key records)
      (cond ((null? records) (list (list key)))
	    ((symbol<? key (caar records)) (cons (list key) records)) ;keys are sorted
	    (else (set-cdr! records (find-insert-point key (cdr records)))
		  records )))

    (define (insert-iter! key-list value table)
      (let ((record (assoc (car key-list) (cdr table))))
	(if record
	  (if (null? (cdr key-list))
	    (set-cdr! record value)
	    (insert-iter! (cdr key-list) value record))
	  (begin (set-cdr! table (find-insert-point (car key-list) (cdr table)))
		 (insert-iter! key-list value table)))
	'ok))

    (define (insert! key-list value)
      (insert-iter! key-list value local-table))

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
	    ((eq? m 'insert-proc!) insert!)
	    (else (error "Unknown operation -- TABLE" m))))
    dispatch))

; test
(define operation-table (make-table))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))

(put '(a a q) 1)
(put '(a b x) 2)
(put '(d b x) 2)
(put '(c l x) 2)
(put '(c n x) 2)
(put '(c m x) 2)
(put '(aa a z) 3)
