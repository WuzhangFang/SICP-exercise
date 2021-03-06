;; Exercise 3.4
(define (make-account balance pwd)
  (let ((count 0))
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance
	       (- balance amount))
	     balance)
      "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (call-the-cops m) "calling the cops")
  (define (incorrect-pwd m) "wrong password")
  (define (dispatch m1 m2)
    (cond ((not (eq? m1 pwd)) (set! count (+ count 1)) 
				     (if (> count 7)
				       call-the-cops
				       incorrect-pwd))
	  ((eq? m2 'withdraw) (set! count 0) withdraw)
	  ((eq? m2 'deposit) (set! count 0) deposit)
	  (else (error "Unknown request: MAKE-ACCOUNT" m2))))
  dispatch))
;; test
(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 40)
((acc 'se-password 'withdraw) 40)
((acc 'se-password 'withdraw) 40)
((acc 'se-password 'withdraw) 40)
((acc 'se-password 'withdraw) 40)
((acc 'se-password 'withdraw) 40)
((acc 'se-password 'withdraw) 40)
((acc 'se-password 'withdraw) 40)
((acc 'se-password 'withdraw) 40)
