;;; Exercise 2.23
(define (for-each f lst)
    (cond ((null? lst) true)
          (else (f (car lst))
                (for-each f (cdr lst)))))

(for-each (lambda (x) (newline) (display x)) (list 1 2 3))
