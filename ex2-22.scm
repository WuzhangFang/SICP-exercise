;;; Exercise 2.22
; iterative process of ex2-21.scm
(define (square-list items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things) (cons (square (car things)) answer))))
    (iter items `()))
(square-list (list 1 2 3 4))
;(define (square-list-2 items)
;    (define (iter things answer)
;        (if (null? things)
;            answer
;            (iter (cdr things) (cons answer (square (car things))))))
;    (iter items `()))
;(square-list-2 (list 1 2 3 4))
(define (square-list-2 items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things) (append answer (list (square (car things)))))))
    (iter items `()))
(square-list-2 (list 1 2 3 4))
