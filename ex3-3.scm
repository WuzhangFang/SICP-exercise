;; Exercise 3.3
(define (make-account balance pwd)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance
	       (- balance amount))
	     balance)
      "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m1 m2)
    (if (eq? m1 pwd)
    	(cond ((eq? m2 'withdraw) withdraw)
	  	((eq? m2 'deposit) deposit)
	  	(else (error "Unknown request: MAKE-ACCOUNT" m2)))
	(lambda (m) "Incorrect password")))
  dispatch)
;; test
(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 40)
((acc 'se-password 'withdraw) 40)

