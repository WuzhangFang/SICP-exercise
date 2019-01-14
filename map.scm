; map takes a procedure and a list as arguments and transforms the list 
; based on the procedure
(define (map-list proc items)
    (if (null? items)
        `()
        (cons (proc (car items))
              (map-list proc (cdr items)))))
(map-list abs (list -1 2 3 -2))

(define (scale-tree tree factor)
    (cond ((null? tree) `())
          ((not (pair? tree)) (* tree factor))
          (else (cons (scale-tree (car tree) factor)
                      (scale-tree (cdr tree) factor)))))
(define lst (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(scale-tree lst 10)
; another way is to use map. map will go over the list and apply the procedure
; to each element of the list and return a list.
(define (scale-tree2 tree factor)
    (map (lambda (sub-tree)
            (if (pair? sub-tree)
                (scale-tree2 sub-tree factor)
                (* sub-tree factor)))
          tree))
(scale-tree2 lst 10)
