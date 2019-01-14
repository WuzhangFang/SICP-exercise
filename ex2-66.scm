;;; Exercise 2.66
; Implement the lookup procedure where the set of records is a binary tree
; set of records: unordered list
;(define (lookup given-key set-of-records)
;  (cond ((null? set-of-records) false)
;	((equal? given-key
;		 (key (car set-of-records)))
;	 (car set-of-records))
;	(else (lookup given-key
;		      (cdr set-of-records)))))
; set of records: binary tree
(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) false)
	((equal? given-key (key (entry set-of-records)))
	 (entry set-of-records))
	((< given-key (key (entry set-of-records)))
	 (lookup given-key (left-branch set-of-records)))
	((> given-key (key (entry set-of-records)))
	 (lookup given-key (right-branch set-of-records)))))
