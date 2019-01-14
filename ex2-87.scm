;; Exercise 2.87
(put '=zero? 'polynomial 
     (lambda (p) (empty-termlist? (term-list p))))
