;; 3.3.3 Representing Tables
;; one-dimensional table
(define (lookup key table)
  (let ((record (assoc key (cdr table))))
    (if record
      (car record)
      false)))
(define (insert! key value table)
  (let ((record (assoc key (car table))))
    (if record
      (set-cdr! record value)
      (set-cdr! table (cons (cons key value) (cdr table)))))
  'ok)
(define (make-table)
  (list '*table*))
