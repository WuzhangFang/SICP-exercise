;; 3.3.3 Representing Tables
;; one-dimensional table
(define (lookup-1d key table)
  (let ((record (assoc key (cdr table))))
    (if record
      (car record)
      false)))
(define (insert!-1d key value table)
  (let ((record (assoc key (car table))))
    (if record
      (set-cdr! record value)
      (set-cdr! table (cons (cons key value) (cdr table)))))
  'ok)
(define (make-table)
  (list '*table*))
;; two-dimensional table
;; Each value is indexed by two keys.
;; When we look up an item, we use the first key to identify the correct subtable.
;; Then we use the second key to identify the record within the subtable.
(define (lookup-2d key-1 key-2 table)
  (let ((subtable (assoc key-1 (cdr table))))
    (if subtable
      (let ((record
	      (assoc key-2 (cdr subtable))))
	(if record (cdr record) false))
      false)))
(define (insert!-2d key-1 key-2 value table)
  (let ((subtable (assoc key-1 (cdr table))))
    (if subtable
      (let ((record (assoc key-2 (cdr subtable))))
	(if record
	  (set-cdr! record value)
	  (set-cdr! subtable (cons (cons key-2 value) (cdr subtable)))))
      (set-cdr! table (cons (list key-1 (cons key-2 value)) (cdr table)))))
  'ok)
;; creating local table
(define (make-table)
  (let ((local-table (list '*table*)))
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


