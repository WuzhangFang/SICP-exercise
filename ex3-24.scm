;; Exercise 3.24
;; use same-key? instead of equal? in the assoc procedure
;; same-key? can use abs with some tolerance to determine
;; whether two keys are same.
(define (make-table)
  (let ((local-table (list '*table*)))
    (define (assoc key records)
      (cond ((null? records) false)
	    ((same-key? key (caar records)) (car records))
	    (else (assoc key (cdr records)))))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (cdr local-table))))
	(if subtable
	  (let ((record (assoc key-2 (cdr subtable))))
	    (if record (car record) false))
	  false)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key1 (cdr local-table))))
	(if subtable
	  (let ((record (assoc key-2 (cdr subtable))))
	    (if record
	      (set-cdr! record value)
	      (set-cdr! subtable (cons (cons key-2 value)
				       (cdr subtable)))))
	  (set-cdr! local-table
		    (cons (list key-1 (cons key-2 value))
			  (cdr local-table)))))
    'ok)
  (define (dispatch m)
    (cond ((eq? m 'lookup-proc) lookup)
	  ((eq? m 'insert-proc!) insert!)
	  (else (error "Unknown operation: TABLE" m))))
  dispatch))

