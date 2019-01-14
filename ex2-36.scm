;;; Exercise 2.36
(load "sequence-operations.scm")
(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        `()
        (cons (accumulate op init (map car seqs)) (accumulate-n op init (map cdr seqs)))))
(define lst (list (list 1 2)
                  (list 3 4)))
(accumulate-n + 0 lst)
