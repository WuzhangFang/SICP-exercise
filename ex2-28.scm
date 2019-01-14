;;; Exercise 2.28 
(define x (list (list 1 2) (list 3 4) 5 6))
(define (fringe x)
        (cond ((null? x) (list))
              ((not (pair? x)) (list x)) 
              (else (append (fringe (car x)) (fringe (cdr x))))))
x
(fringe x)
(list x x)
(fringe (list x x))
