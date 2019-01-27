;; Exercise 3.10
(define (make-withdraw-1 balance)
    (lambda (amount)
        (if (>= balance amount)
            (begin (set! balance
                         (- balance amount))
                   balance)
            "Insufficent funds")))
(define (make-withdraw-2 initial-amount)
    (let ((balance initial-amount))
        (lambda (amount)
            (if (>= balance amount)
                (begin (set! balance
                             (- balance amount))
                       balance)
            "Insufficent funds"))))
;; rewrite (let ((balance initial-amount)) <body>) using lambda expression
(define (make-withdraw-2 initial-amount)
    ((lambda (balance)
        (lambda (amount)
            (if (>= balance amount)
                (begin (set! balance
                             (- balance amount))
                       balance)
            "Insufficent funds")))
    initial-amount))
;; test
(define W1 (make-withdraw-1 100))
(W1 50)
(define W2 (make-withdraw-2 100))
(W2 50)
;; environment model
;;
;;                 +--------------------------------------+
;; global env ---> |  W2 -------+                         |
;;                 +------------|-------------------------+
;;                              |               ^
;;                              |               |
;;                              |     +-------------------+
;;				|     |initial-amount: 100| <-- E1
;;			        |     +-------------------+ 
;;                              |               ^
;;				|		|
;;                              |         +------------+
;;				|         |balance: 100| <-- E2
;;			        |         +------------+
;;                              |               ^
;;                              v               | 
;;                           [O][O]-------------+
;;                            |
;;                            v
;;                        parameter: amount
;;                        body:
;;			  (if (>= banlance amount)
;;			    (begin (set! balance
;;				     	 (- balance amount))
;;				   balance)
;;			    "Insufficient funds")
