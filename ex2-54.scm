;;; Exercise 2.54
(define (equal-1? lst1 lst2)
    (cond ((and (null? lst1) (null? lst2)) #t)
          ((and (list? lst1) (list? lst2)) (and (equal-1? (car lst1) (car lst2))
                                                (equal-1? (cdr lst1) (cdr lst2))))
          ((and (symbol? lst1) (symbol? lst2)) (eq? lst1 lst2))
          (else #f)))

(equal-1? '(this is a list) '(this is a list))
(equal-1? '(this is a list) '(this (is a) list))
(equal-1? 'this 'this)
(equal-1? 'this 'ths)
