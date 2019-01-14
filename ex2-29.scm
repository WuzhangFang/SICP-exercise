;;; Exercise 2.29
(define (make-mobile left right)
    (list left right))
(define (left-branch mobile)
    (car mobile))
(define (right-branch mobile)
    (cadr mobile))
; len is a number and structure can be a number (representing weight) or another mobile
(define (make-branch len struc)
    (list len struc))
; branch-len and branch-struc are to get len and structure of the branch
(define (branch-len branch)
   (car branch))
(define (branch-struc branch)
    (cadr branch))
(define (total-weight mobile)
    (cond ((null? mobile) 0)
          ((not (pair? mobile)) mobile)
          (else (+ (total-weight (branch-struc (left-branch mobile))) 
                   (total-weight (branch-struc (right-branch mobile)))))))
; balanced?
; 1. the torque of top-left branch equals the torque of the top-right branch.
; 2. each of the sub-mobiles is also balanced.
(define (balanced? mobile)
    (cond ((null? mobile) true)
          ((not (pair? mobile)) true)
          (else
            (and (= (* (branch-len (left-branch mobile)) (total-weight (branch-struc (left-branch mobile)))) 
                    (* (branch-len (right-branch mobile)) (total-weight (branch-struc (right-branch mobile))))) 
                 (balanced? (branch-struc (left-branch mobile)))
                 (balanced? (branch-struc (right-branch mobile)))))))

; test
(define m1 (make-mobile
                (make-branch 4 6)
                (make-branch 5 (make-mobile (make-branch 3 7)
                                            (make-branch 9 8)))))
m1
(total-weight m1)
(balanced? m1)
;;;;;m1;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          4  |  5 
;;        +----+-----+ 
;;        6        3 |     9 
;;               +---+---------+ 
;;               7             8 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define m2 (make-mobile
                 (make-branch 4 6)
                 (make-branch 2 (make-mobile (make-branch 5 8)
                                             (make-branch 10 4)))))
;;;;;m2;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          4  |  2 
;;        +----+--+ 
;;        6     5 |     10 
;;          +-----+----------+ 
;;          8                4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 m2
 (total-weight m2)
 (balanced? m2)
