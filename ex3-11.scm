;; Exercise 3.11
(define (make-account balance)
    (define (withdraw amount)
          (if (>= balance amount)
	      (begin (set! balance
	             (- balance amount))
	      balance)
	      "Insufficient funds"))
     (define (deposit amount)
	    (set! balance (+ balance amount))
	        balance)
     (define (dispatch m)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Unknown request: MAKE-ACCOUNT" m))))
dispatch)
;; test
(define acc (make-account 50))
((acc 'deposit) 40)
((acc 'withdraw) 60)
;;---------------------------------------------------------------------------------------------
;;               +--------------+
;; global env -> | make-account |
;;               +--------------+
;;                  |       ^
;;                  v       |
;;                [O][O]----+
;;                 |
;;                 |
;;                 v
;;         parameters: balance
;;         body: (define withdraw ...)
;;               (define deposit ...)
;;               (define dispatch ...)
;;               dispatch
;;---------------------------------------------------------------------------------------------- 
;;                                                                   body: ...
;;                                                                   parameters: amount 
;;               +--------------------------------+                     ^
;; global env -> | make-account        acc -------|------+              | 
;;               +--------------------------------+      |       + -[O][O] 
;;                  |       ^                  ^         |       |    ^
;;                  v       |                  |         v       v    |
;;                [O][O]----+        +--------------------------------|--------------------+
;;                 |                 | balance: 50     dispatch    withdraw    deposit     |--> E1
;;                 v                 +-------------------|-----------------------|---------+
;;      parameters: balance                ^             |     ^      ^          |     ^
;;      body: (define withdraw ...)        |             v     |      |          v     |
;;            (define deposit ...)         |           [O][O]--+      |        [O][O]--+
;;            (define dispatch ...)        |            |             |         |
;;                                         |            v             |         v
;;                                         |        parameters: m     |     parameters: amount
;;                                         |        body: ...         |     body: ...
;;                                  +-----------+                 +------------+     
;;                          E2  <---|m: 'deposit|         E3  <---|m: 'withdraw|    
;;                                  +-----------+                 +------------+    
;;                                  call to deposit               call to withdraw
